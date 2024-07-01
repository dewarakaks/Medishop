<?php 
session_start();
include 'koneksi.php';

//jik tidak ada pelanggan(blm login)
if (!isset($_SESSION["pelanggan"]) OR empty($_SESSION["pelanggan"])) 
{
	echo "<script>alert('silahkan login dulu');</script>";
	echo "<script>location='login.php';</script>";
	exit();
}
?>

<!DOCTYPE html>
<html>
<head>
  <title>IPSUM Store</title>
 
  <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <link rel="stylesheet" type="text/css" href="fontawesome/css/all.min.css">

    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>

  <!-- navbar -->
  <?php include 'template/navbar.php'; ?>


  <section class="riwayat" style="margin-top: 10%;">
  	<div class="container">
  		<h3>Riwayat Belanja Anda, <?php echo $_SESSION ["pelanggan"]["nama_pelanggan"]  ?></h3>

  		<table class="table table-bordered">	
  			<thead>
  				<tr>		
	  				<th>No.</th>
	  				<th>Tanggal</th>
	  				<th>Status</th>
	  				<th>Total</th>
	  				<th>aksi</th>
  				</tr>
  			</thead>
			  <tbody>
        <?php $nomor = 1; ?>
        <?php 
          $id_pelanggan = $_SESSION["pelanggan"]["id_pelanggan"];
          $ambil = $koneksi->query("SELECT * FROM pembelian WHERE id_pelanggan='$id_pelanggan' ORDER BY tgl_pembelian DESC");//mengurutkan data dari terbesar(terbaru) berdasarkan tanggal
		
		  //multidimensi array
          while ($pecah = $ambil->fetch_assoc()) { 
        ?>

		<!-- Menampilkan data dalam table //No.	//Tanggal	//Status	//Total		//aksi -->
          <tr>
            <td><?php echo $nomor; ?></td>
            <td><?php echo $pecah["tgl_pembelian"]; ?></td>
            <td>
              <?php echo $pecah["status_pembelian"]; ?><br>
              <?php if (!empty($pecah['resi_pengiriman'])): ?>
                Resi : <?php echo $pecah['resi_pengiriman']; ?>
              <?php endif ?>
            </td>
            <td><?php echo number_format($pecah["total_pembelian"]); ?></td>
            <td>

			<!-- Kolom button Aksi -->
              <a href="nota.php?id=<?php echo $pecah["id_pembelian"]; ?>" class="btn btn-info">Nota</a>
              <?php if ($pecah['status_pembelian'] == "pending"): ?>
                <a href="pembayaran.php?id=<?php echo $pecah["id_pembelian"]; ?>" class="btn btn-success">Konfirmasi Pembayaran</a>
              <?php else: ?>  
                <a href="lihat_pembayaran.php?id=<?php echo $pecah["id_pembelian"]; ?>" class="btn btn-warning">Lihat Pembayaran</a>
              <?php endif ?>
            </td>
          </tr>
        <?php $nomor++; ?>
        <?php } ?>
      </tbody>
    </table>
  </div>
</section>

</body>
</html>