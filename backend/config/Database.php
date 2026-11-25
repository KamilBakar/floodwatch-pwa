<?php

class Database
{
    private array $config;

    public function __construct()
    {
        $path = __DIR__ . '/config.local.php';

        if (!file_exists($path)) {
            throw new RuntimeException('Missing config.local.php');
        }

        $this->config = require $path;
    }

    public function connect(): PDO
    {
        $dsn = "mysql:host={$this->config['db_host']};"
             . "dbname={$this->config['db_name']};charset=utf8mb4";

        return new PDO($dsn, $this->config['db_user'], $this->config['db_pass'], [
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
            PDO::ATTR_EMULATE_PREPARES => false,
        ]);
    }
}