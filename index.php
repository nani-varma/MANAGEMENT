<?php
// Database connection
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "university_library";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Define queries
$queries = [
    "register_user" => [
        "description" => "Register a new user",
        "sql" => "INSERT INTO Users (first_name, last_name, email, password, contact_phone, contact_address_street, contact_address_city, contact_address_postal_code, contact_address_country) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)"
    ],
    "authenticate_user" => [
        "description" => "Authenticate a user",
        "sql" => "SELECT * FROM Users WHERE email = ? AND password = ?"
    ],
    "categorised_books" => [
        "description" => "Categorised list of available books",
        "sql" => "SELECT * FROM Books ORDER BY average_rating DESC"
    ],
    "enroll_user" => [
        "description" => "Enroll a user to borrow or buy books",
        "sql" => "INSERT INTO BookRequests (user_id, book_id, status) VALUES (?, ?, 'Pending')"
    ],
    "request_material" => [
        "description" => "Request to borrow or buy library materials",
        "sql" => "UPDATE BookRequests SET status = 'Approved' WHERE request_id = ?"
    ],
    "available_resources" => [
        "description" => "Overall state of available resources",
        "sql" => "SELECT * FROM Books"
    ],
    "categorize_books" => [
        "description" => "Categorize the book/resources to be borrowed or sold",
        "sql" => "SELECT * FROM Books WHERE available_copies > 0"
    ]
];

function getInputFields($queryKey) {
    $fields = [];
    switch ($queryKey) {
        case "register_user":
            $fields = ["first_name", "last_name", "email", "password", "contact_phone", "contact_address_street", "contact_address_city", "contact_address_postal_code", "contact_address_country"];
            break;
        case "authenticate_user":
            $fields = ["email", "password"];
            break;
        case "enroll_user":
            $fields = ["user_id", "book_id"];
            break;
        case "request_material":
            $fields = ["request_id"];
            break;
        default:
            break;
    }
    return $fields;
}

// Execute and display query results
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['query_key'])) {
    $queryKey = $_POST['query_key'];
    $query = $queries[$queryKey]['sql'];
    $stmt = $conn->prepare($query);

    if ($stmt !== false) {
        $fields = getInputFields($queryKey);
        if (!empty($fields)) {
            $params = [];
            foreach ($fields as $field) {
                $params[] = $_POST[$field];
            }
            $types = str_repeat('s', count($params)); // assuming all fields are strings
            $stmt->bind_param($types, ...$params);
        }

        if ($stmt->execute()) {
            if (strpos($query, 'SELECT') !== false) {
                $result = $stmt->get_result();
                if ($result->num_rows > 0) {
                    echo "<table border='1'><tr>";
                    while ($field = $result->fetch_field()) {
                        echo "<th>{$field->name}</th>";
                    }
                    echo "</tr>";
                    while ($row = $result->fetch_assoc()) {
                        echo "<tr>";
                        foreach ($row as $data) {
                            echo "<td>{$data}</td>";
                        }
                        echo "</tr>";
                    }
                    echo "</table>";
                } else {
                    echo "No results found.";
                }
            } else {
                echo "Query executed successfully.";
            }
        } else {
            echo "Error executing query: " . $stmt->error;
        }
        $stmt->close();
    } else {
        echo "Error preparing query: " . $conn->error;
    }
}

$conn->close();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Library Management Interface</title>
    <style>
        body {
            background: url('background.jpg') no-repeat center center fixed;
            background-size: cover;
            font-family: Arial, sans-serif;
            color: #333;
            padding: 20px;
        }
        h1 {
            color: #fff;
            text-align: center;
        }
        form {
            background-color: rgba(255, 255, 255, 0.8);
            padding: 20px;
            border-radius: 10px;
            max-width: 600px;
            margin: auto;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        label {
            display: block;
            margin-bottom: 10px;
            color: #333;
        }
        input[type="text"], select {
            width: calc(100% - 22px);
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        button {
            display: block;
            width: 100%;
            padding: 10px;
            background-color: #28a745;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
        button:hover {
            background-color: #218838;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: rgba(255, 255, 255, 0.9);
        }
        table, th, td {
            border: 1px solid #ccc;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #f8f9fa;
        }
    </style>
</head>
<body>
    <h1>Library Management Interface</h1>
    <form method="post">
        <label for="query_key">Choose a query to run:</label>
        <select name="query_key" id="query_key" onchange="showFields(this.value)">
            <option value="">Select a query</option>
            <?php
            foreach ($queries as $key => $query) {
                echo "<option value=\"$key\">{$query['description']}</option>";
            }
            ?>
        </select>
        <div id="input-fields"></div>
        <button type="submit">Run Query</button>
    </form>
    <hr>
    <?php
    // Display results here if any
    ?>
    <script>
        const queries = <?php echo json_encode($queries); ?>;
        
        function showFields(queryKey) {
            const fields = getInputFields(queryKey);
            let html = '';
            if (fields.length > 0) {
                fields.forEach(field => {
                    html += `<label for="${field}">${field.replace('_', ' ')}:</label><input type="text" name="${field}" id="${field}"><br>`;
                });
            }
            document.getElementById('input-fields').innerHTML = html;
        }

        function getInputFields(queryKey) {
            let fields = [];
            switch (queryKey) {
                case "register_user":
                    fields = ["first_name", "last_name", "email", "password", "contact_phone", "contact_address_street", "contact_address_city", "contact_address_postal_code", "contact_address_country"];
                    break;
                case "authenticate_user":
                    fields = ["email", "password"];
                    break;
                case "enroll_user":
                    fields = ["user_id", "book_id"];
                    break;
                case "request_material":
                    fields = ["request_id"];
                    break;
                default:
                    break;
            }
            return fields;
        }
    </script>
</body>
</html>
