<?php include 'koneksi.php'; ?>

<!-- pencarian produk berdasarkan keyword yang ada pada produk dan deskripsi produkk -->
<?php 
$keyword = $_GET["keyword"];
$semuadata = array();
$ambil = $koneksi->query("SELECT * FROM produk WHERE nama_produk LIKE '%$keyword%' OR deskripsi LIKE '%$keyword%'");
while ($pecah = $ambil->fetch_assoc()) {
    $semuadata[] = $pecah;
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Pencarian</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="fontawesome/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="style.css"> 
</head>
<body>

    <!-- Navbar -->
    <?php include 'template/navbar.php'; ?>

    <div class="container mt-5">
        <div class="row">
            <div class="col-md-2 bg-light">
                <ul class="list-group list-group-flush p-2 pt-5">
                    <li class="list-group-item bg-primary text-white"><i class="fas fa-list"></i> KATEGORI PRODUK</li>

                    <?php $ambil = $koneksi->query("SELECT * FROM kategori "); ?>
                    <?php while ($pecah = $ambil->fetch_assoc()) { ?>
                        <li class="list-group-item"><i class="fas fa-angle-double-right"></i>
                            <a href="kategori.php?category=<?php echo $pecah['id_kategori']; ?>"><?php echo $pecah["kategori"]; ?></a>
                        </li>
                    <?php } ?>
                </ul>
            </div>

            <div class="col-md-10">
                <h4 class="text-center font-weight-bold m-4">Pencarian Produk: <font color="red"><?php echo $keyword; ?></font></h4>
                <div class="row">
                    <?php foreach ($semuadata as $key => $value) { ?>
                        <div class="card mr-2 ml-2 mb-2" style="width: 16rem;">
                            <img src="foto_produk/<?php echo $value['foto_produk']; ?>" class="card-img-top" alt="...">
                            <div class="card-body">
                                <h3><?php echo $value['nama_produk']; ?></h3>
                                <h5>Rp. <?php echo number_format($value['harga']); ?></h5>
                                <a href="beli.php?id=<?php echo $value['id_produk']; ?>" class="btn btn-primary">Beli</a>
                                <a href="detail.php?id=<?php echo $value['id_produk']; ?>" class="btn btn-primary">Detail</a>
                            </div>
                        </div>
                    <?php } ?>
                </div>
            </div>
        </div>
    </div>

    <?php include 'template/footer.php'; ?>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGaN0jYj0NxwEzQ0D2H7eKw1T2" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwE
