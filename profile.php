<?php
session_start();
include 'koneksi.php';

// Pastikan pengguna sudah login
if (!isset($_SESSION['pelanggan'])) {
    echo "<script>alert('Anda harus login');</script>";
    echo "<script>location='login.php';</script>";
    exit();
}

// Ambil data pelanggan dari database
$id_pelanggan = $_SESSION['pelanggan']['id_pelanggan'];
$ambil = $koneksi->query("SELECT * FROM pelanggan WHERE id_pelanggan='$id_pelanggan'");
$detail = $ambil->fetch_assoc();
?>

<!DOCTYPE html>
<html>
<head>
    <title>Profil Pelanggan</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="fontawesome/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <!-- navbar -->
    <?php include 'template/navbar.php'; ?>

    <section class="konten" style="margin-top: 10%;">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <h3>Pelanggan</h3>
                    <strong>Nama : <?php echo $detail['nama_pelanggan']; ?></strong> <br>
                    <p>
                        Telepon: <?php echo $detail['telepon']; ?><br>
                        Email: <?php echo $detail['email']; ?><br>
                        Alamat: <?php echo $detail['alamat']; ?>
                    </p>
                </div>
            </div>
        </div>
    </section>

    <?php include 'template/footer.php'; ?>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGaN0jYj0NxwEzQ0D2H7eKw1T2" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>
