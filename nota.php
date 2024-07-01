<?php 
session_start();
include 'koneksi.php';
?>
<!DOCTYPE html>
<html>
<head>
  <title>Nota Pembelian</title>
  
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

  <section class="konten" style="margin-top: 10%;">
    <div class="container">
      <h2 style="color: green">Nota Pembelian</h2>

      <?php 
      $ambil = $koneksi->query("SELECT * FROM pembelian JOIN pelanggan ON pembelian.id_pelanggan=pelanggan.id_pelanggan WHERE pembelian.id_pembelian='$_GET[id]'");
      $detail = $ambil->fetch_assoc();
      ?>

      <?php 
      $idpelangganyangbeli = $detail["id_pelanggan"];
      $idpelangganyanglogin = $_SESSION["pelanggan"]["id_pelanggan"];

      if ($idpelangganyangbeli !== $idpelangganyanglogin) {
        echo "<script>alert('Proses')</script>";
        echo "<script>location='riwayat.php';</script>";
        exit();
      }
      ?>

      <div class="row">
        <div class="col-md-4">
          <h3>Pelanggan</h3>
          <strong><?php echo $detail['nama_pelanggan']; ?></strong> <br>
          <p>
            <?php echo $detail['telepon']; ?><br>
            <?php echo $detail['email']; ?>
            
          </p>
        </div>

        <div class="col-md-4">
          <h3>Pembelian</h3>
          <strong>No. Pembelian: <?php echo $detail['id_pembelian'] ?></strong><br>
          Tanggal: <?php echo $detail['tgl_pembelian']; ?><br>
          Total: Rp. <?php echo number_format($detail['total_pembelian']); ?><br>
          Status:<b style="color: green"> <?php echo $detail['status_pembelian']; ?> </b><!-- Menambahkan status pembayaran -->
        </div>

        <div class="col-md-4">
          <h3>Pengiriman</h3>
          <strong><?php echo $detail['nama_kota']; ?></strong><br>
          Ongkos Kirim: Rp. <?php echo number_format($detail['tarif']); ?> <br>
          Alamat Pengiriman: <?php echo $detail['alamat_pengiriman']; ?> <br>
          No Resi: <?php echo $detail['resi_pengiriman']; ?> 
        </div>
      </div>

      <table class="table table-bordered">
        <thead>
          <tr>
            <th>No</th>
            <th>Nama Produk</th>
            <th>Harga</th>
            <th>Berat (Gr)</th>
            <th>Jumlah</th>
            <th>Subtotal</th>
          </tr>
        </thead>
        <tbody>
          <?php 
          $nomor = 1;
          $ambil = $koneksi->query("SELECT * FROM pembelian_produk WHERE id_pembelian='$_GET[id]'");
          while($pecah = $ambil->fetch_assoc()) { ?>
            <tr>
              <td><?php echo $nomor; ?></td>
              <td><?php echo $pecah['nama']; ?></td>
              <td>Rp. <?php echo number_format($pecah['harga']); ?></td>
              <td><?php echo $pecah['berat']; ?></td>
              <td><?php echo $pecah['jumlah']; ?></td>
              <td>Rp. <?php echo number_format($pecah['subharga']); ?></td>
            </tr>
            <?php 
            $nomor++; 
          } ?>
        </tbody>
      </table>

      <div class="row">
        <div class="col-md-7">
          <div class="alert alert-info">
            <p>
              Silahkan melakukan pembayaran Rp. <?php echo number_format($detail['total_pembelian']); ?> ke:
              <br>
              <strong>Bank BCA 89326469347 A/n Ipsum Store</strong>
              <br>
              <strong>Bank BRI 3453543631 A/n Ipsum Store</strong>
            </p>
          </div>
        </div>
      </div>
      
      <!-- Button to download PDF -->
      <button id="downloadPdf" class="btn btn-primary">Download Nota PDF</button>
    </div>
  </section>
  
  <?php include 'template/footer.php'; ?>

  <!-- jsPDF library -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.3.1/jspdf.umd.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.3.2/html2canvas.min.js"></script>
  <script>
    document.getElementById('downloadPdf').addEventListener('click', function () {
      const { jsPDF } = window.jspdf;
      const doc = new jsPDF();
      html2canvas(document.querySelector('.konten')).then(canvas => {
        const imgData = canvas.toDataURL('image/png');
        const imgWidth = 190; // Max width for the image
        const pageHeight = 290; // Max height for the image
        const imgHeight = canvas.height * imgWidth / canvas.width;
        const heightLeft = imgHeight;

        doc.addImage(imgData, 'PNG', 10, 10, imgWidth, imgHeight);
        doc.save('NotaPembelian.pdf');
      });
    });
  </script>
</body>
</html>
