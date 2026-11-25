<?php
function sendJson(int $status, $data = null): void
{
    http_response_code($status);
    header('Content-Type: application/json');
    if ($data !== null) {
        echo json_encode($data);
    }
}