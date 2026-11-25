<?php

// Never print PHP warnings into the JSON body (they would corrupt it).
ini_set('display_errors', '0');

require_once __DIR__ . '/config/Database.php';

header('Content-Type: application/json');

try {
    $database = new Database();
    $connection = $database->connect();

    echo json_encode([
        "status" => "success",
        "message" => "Database connected"
    ]);
} catch (Throwable $e) {
    // Real details go to the server log only.
    error_log($e->getMessage());

    http_response_code(500);
    echo json_encode(["error" => "Database error"]);
}