<?php
$host = "localhost";
$username = "root";
$password = "";
$database = "toko_baju";

$koneksi = new mysqli($host, $username, $password, $database);
if ($koneksi->connect_error) {
    die("Database tidak terhubung" . $koneksi->connect_error);
}
