-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 25 Jun 2024 pada 11.52
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toko-baju`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `nama` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id_admin`, `username`, `password`, `nama`) VALUES
(1, 'admin', 'admin', 'admin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(11) NOT NULL,
  `kategori` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `kategori`) VALUES
(8, 'Sneakers'),
(12, 'Apparel'),
(14, 'Toys');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ongkir`
--

CREATE TABLE `ongkir` (
  `id_ongkir` int(6) NOT NULL,
  `nama_kota` varchar(100) NOT NULL,
  `tarif` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `ongkir`
--

INSERT INTO `ongkir` (`id_ongkir`, `nama_kota`, `tarif`) VALUES
(1, 'Jakarta-Jawa Tengah', 22000),
(2, 'jabodetabek', 22000),
(3, 'Jakarta-Jawa Timur', 22000),
(4, 'Jakarta-Yogyakarta', 16000),
(5, 'Jakarta-Sumatra', 28000),
(6, 'Jakarta-Kalimantan', 30000),
(7, 'Jakarta-Bali', 22000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `nama_pelanggan` varchar(30) NOT NULL,
  `telepon` varchar(25) NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `email`, `password`, `nama_pelanggan`, `telepon`, `alamat`) VALUES
(5, 'bambang@gmail.com', 'bambang123', 'bambang', '08347232312', 'bekasi'),
(6, 'test123@gmail.com', 'test12345', 'budi', '078675', 'bekasi'),
(7, 'dimas@gmail.com', '$2y$10$fYx7mW14e4EmgxEhZuQ1xe0', 'Dimas Triyana', '08634673458', 'jl. bagus perkasa 1 kosambi'),
(8, 'konoha123@gmail.com', '$2y$10$5mOsgtDcTMy74/C7uTUgOOO', 'Konoha', '0937485735', 'jl.bagus\r\n'),
(9, 'asas@gmail.com', '$2y$10$xqGcLgjZJGP/Zt1Ic.CBR.p', 'asasdsd', '038497324', 'kasjhdsf'),
(10, 'asasasa@gmail.com', 'asas', 'asasa', '09293892730', 'ladsjs'),
(11, 'bayu@gmail.com', 'bayu123', 'Bayu', '086276373', 'medayu utara\r\n'),
(12, 'dimas123@gmail.com', 'dimas123', 'dimas', '08397483', 'rungkut'),
(13, 'dewarakaks@gmail.com', '123raka', 'raka', '081', 'dewa');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` int(11) NOT NULL,
  `id_pembelian` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `bank` varchar(255) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `bukti` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `pembayaran`
--

INSERT INTO `pembayaran` (`id_pembayaran`, `id_pembelian`, `nama`, `bank`, `jumlah`, `tanggal`, `bukti`) VALUES
(1, 1, 'Lancelot', 'bri', 247000, '2021-07-17', '20210717062455FB_IMG_1437282787040.jpg'),
(2, 2, 'anggi', 'bri', 386000, '2021-07-24', '20210724051557afaf890e0e3c51e2c81cb212f6e9243b.jpg'),
(3, 3, 'anggi', 'bni', 167000, '2021-07-24', '20210724061501afaf890e0e3c51e2c81cb212f6e9243b.jpg'),
(4, 4, 'khan', 'bri', 145000, '2021-07-24', '20210724080257afaf890e0e3c51e2c81cb212f6e9243b.jpg'),
(5, 6, 'lancelot', 'bri', 222000, '2021-07-25', '20210725155423afaf890e0e3c51e2c81cb212f6e9243b.jpg'),
(6, 9, 'Bambang', 'bca', 822000, '2024-06-06', '20240606164624air-jordan-hex-slides-off-white.png'),
(7, 14, 'Bayu', 'bca', 1, '2024-06-25', '20240625033950CijPcYMUUAAzb46.jpg'),
(8, 15, 'Bayu', 'bri', 822, '2024-06-25', '20240625034409CijPcYMUUAAzb46.jpg'),
(9, 16, 'Dimas Triyana', 'bca', 822000, '2024-06-25', '20240625053946CijPcYMUUAAzb46.jpg'),
(10, 17, '123', 'bb', 2322000, '2024-06-25', '20240625115108Sonny Angel Cat Life Series Blind Box.png');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembelian`
--

CREATE TABLE `pembelian` (
  `id_pembelian` int(11) NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `id_ongkir` int(6) NOT NULL,
  `tgl_pembelian` date NOT NULL,
  `total_pembelian` int(11) NOT NULL,
  `nama_kota` varchar(100) NOT NULL,
  `tarif` int(11) NOT NULL,
  `alamat_pengiriman` text NOT NULL,
  `status_pembelian` varchar(100) NOT NULL DEFAULT 'pending',
  `resi_pengiriman` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `pembelian`
--

INSERT INTO `pembelian` (`id_pembelian`, `id_pelanggan`, `id_ongkir`, `tgl_pembelian`, `total_pembelian`, `nama_kota`, `tarif`, `alamat_pengiriman`, `status_pembelian`, `resi_pengiriman`) VALUES
(1, 1, 1, '2021-07-17', 247000, 'Jambi-BatangHari', 22000, 'jln yuuk, rt 01 batanghari city', 'barang dikirim', '987654'),
(2, 3, 4, '2021-07-24', 386000, 'Jambi-Merangin', 16000, 'hiuhwhiihkwkwj', 'barang dikirim', '09876547888'),
(3, 3, 3, '2021-07-24', 167000, 'Jambi-Kerinci', 22000, 'jambi', 'barang dikirim', '124'),
(6, 1, 1, '2021-07-25', 222000, 'Jambi-BatangHari', 22000, 'jlnjln', 'barang dikirim', '0987111'),
(7, 3, 1, '2021-07-26', 127000, 'Jambi-BatangHari', 22000, 'Kambang', 'pending', ''),
(8, 5, 6, '2024-06-06', 156000, 'Jambi-Tebo', 16000, 'bekasi', 'pending', ''),
(9, 5, 2, '2024-06-06', 822000, 'Jambi-Bungo', 22000, 'bekasi', 'lunas', 'asasas34345'),
(10, 5, 5, '2024-06-19', 828000, 'Jambi-Sarolangun', 28000, 'asa', 'pending', ''),
(11, 5, 0, '2024-06-19', 2300000, '', 0, '', 'pending', ''),
(12, 5, 0, '2024-06-19', 800000, '', 0, '', 'pending', ''),
(13, 6, 2, '2024-06-19', 12522000, 'Jambi-Bungo', 22000, 'asd', 'pending', ''),
(14, 11, 3, '2024-06-25', 822000, 'Jakarta-Jawa Timur', 22000, 'Jl. Medayu Utara I no 48, Surabaya, Jawa Timur', 'sudah kirim pembayaran', ''),
(15, 11, 2, '2024-06-25', 822000, 'jabodetabek', 22000, 'bekasi', 'sudah kirim pembayaran', ''),
(16, 12, 1, '2024-06-25', 822000, 'Jakarta-Jawa Tengah', 22000, 'rungkut', 'barang dikirim', '8326423786476sd'),
(17, 13, 1, '2024-06-25', 2322000, 'Jakarta-Jawa Tengah', 22000, '', 'barang dikirim', '123');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembelian_produk`
--

CREATE TABLE `pembelian_produk` (
  `id_pembelian_produk` int(11) NOT NULL,
  `id_pembelian` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `harga` int(11) NOT NULL,
  `berat` int(11) NOT NULL,
  `subberat` int(11) NOT NULL,
  `subharga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `pembelian_produk`
--

INSERT INTO `pembelian_produk` (`id_pembelian_produk`, `id_pembelian`, `id_produk`, `jumlah`, `nama`, `harga`, `berat`, `subberat`, `subharga`) VALUES
(1, 1, 97, 1, 'Celana Levis', 225000, 600, 600, 225000),
(2, 2, 96, 1, 'Baju Wanita', 145000, 500, 500, 145000),
(3, 2, 97, 1, 'Celana Levis', 225000, 600, 600, 225000),
(4, 3, 96, 1, 'Baju Wanita', 145000, 500, 500, 145000),
(5, 4, 96, 1, 'Baju Wanita', 145000, 500, 500, 145000),
(6, 5, 97, 1, 'Celana Levis', 225000, 600, 600, 225000),
(7, 6, 94, 2, 'jaket maroon', 100000, 500, 1000, 200000),
(8, 7, 104, 1, 'Celana Karet', 105000, 700, 700, 105000),
(9, 8, 106, 1, 'Sajadah Travel hijau', 30000, 200, 200, 30000),
(10, 8, 105, 1, 'Celana Kulot ALL SIZE Fit XL', 110000, 700, 700, 110000),
(11, 9, 111, 1, 'Lifework Big Gold Radog Tee Black', 800000, 200, 200, 800000),
(12, 10, 111, 1, 'Lifework Big Gold Radog Tee Black', 800000, 200, 200, 800000),
(13, 11, 110, 1, 'Nike x Stussy Washed Hoodie Black (Asia Sizing)', 2300000, 200, 200, 2300000),
(14, 12, 111, 1, 'Lifework Big Gold Radog Tee Black', 800000, 200, 200, 800000),
(15, 13, 109, 1, 'Air Jordan 1 Retro High Travis Scott', 12500000, 500, 500, 12500000),
(16, 14, 111, 1, 'Lifework Big Gold Radog Tee Black', 800000, 200, 200, 800000),
(17, 15, 111, 1, 'Lifework Big Gold Radog Tee Black', 800000, 200, 200, 800000),
(18, 16, 111, 1, 'Lifework Big Gold Radog Tee Black', 800000, 200, 200, 800000),
(19, 17, 110, 1, 'Nike x Stussy Washed Hoodie Black (Asia Sizing)', 2300000, 200, 200, 2300000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL,
  `nama_produk` varchar(50) NOT NULL,
  `id_kategori` varchar(50) NOT NULL,
  `harga` int(11) NOT NULL,
  `stok_produk` int(10) NOT NULL,
  `berat` int(11) NOT NULL,
  `foto_produk` varchar(50) NOT NULL,
  `deskripsi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`id_produk`, `nama_produk`, `id_kategori`, `harga`, `stok_produk`, `berat`, `foto_produk`, `deskripsi`) VALUES
(107, 'Nike Dunk Low Summit Platinum Tint', '8', 1300000, 4, 500, 'nike-dunk-low-summit-platinum-tint.png', ' Size 40\r\n\r\nCrafted meticulously from full leather, it ensures durability and breathability. Perforations on the toe box and mesh tongues enhance ventilation. With a White base and Platinum Tint overlays, it exudes a sleek look. Midnight Navy accents on the Swoosh logos, tongue, insole, and heel branding add contrast.			\r\n		'),
(108, 'Nike Dunk Low Retro White Black Panda', '8', 1050000, 1, 500, 'nike-dunk-low-retro-white-black-panda.png', 'Size 42\r\n\r\nThe Nike Dunk Low Retro White Black (2021) treats the retro model to an essential two-tone color scheme that accentuates the sneaker’s clean lines, developed by designer Peter Moore and responsible for the shoe’s easy transition from the hardwood to the street. The leather upper combines a white base with contrasting black overlays that wrap around the toe and heel. On both the woven tongue tag and heel tab, Nike branding in white stands out in relief against a black backdrop.'),
(109, 'Air Jordan 1 Retro High Travis Scott', '8', 12500000, 0, 500, 'jordan-1-retro-high-travis-scott.png', 'Size 41\r\n\r\nThe Jordan 1 Retro High Travis Scott features a new look on the iconic silhouette, thanks to an oversized backward-facing Swoosh on the lateral side. A traditionally oriented Swoosh graces the medial side of the upper, which is built with a blend of white leather and brown suede. Additional unique details include a double-layer construction on the collar and Scott’s crudely drawn face logo embossed on the heel\r\n\r\n'),
(110, 'Nike x Stussy Washed Hoodie Black (Asia Sizing)', '12', 2300000, 4, 200, 'nike-x-stussy-washed-hoodie-black-asia-sizing.png', ' Size L\r\n\r\nNike is teaming up with Stussy yet again. This time, though, to reimagine its comfy basics through a streetwear lens. Laid-back and casual, this hoody is crafted from a soft cotton blend, fleece-lined for comfort and cut to a relaxed fit, then it’s stone washed to achieve its lived-in look and feel. It’s duel branded, too, at the chest, with each brands signature logo.\r\n\r\n			\r\n		'),
(111, 'Lifework Big Gold Radog Tee Black', '12', 800000, 9, 200, 'lifework-big-gold-radog-tee-black-lw.jpg', '  Size M\r\n\r\nGold Big Radog Short Sleeve Tshirt - Black\r\n			\r\n					\r\n		'),
(113, 'Sonny Angel Cat Life Series Blind Box', '14', 285000, 1, 100, 'Sonny Angel Cat Life Series Blind Box.png', '   Sonny Angel Cat Life Series Blind Box\r\n			\r\n					\r\n					\r\n		');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indeks untuk tabel `ongkir`
--
ALTER TABLE `ongkir`
  ADD PRIMARY KEY (`id_ongkir`);

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indeks untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`);

--
-- Indeks untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id_pembelian`);

--
-- Indeks untuk tabel `pembelian_produk`
--
ALTER TABLE `pembelian_produk`
  ADD PRIMARY KEY (`id_pembelian_produk`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `ongkir`
--
ALTER TABLE `ongkir`
  MODIFY `id_ongkir` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `id_pembelian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `pembelian_produk`
--
ALTER TABLE `pembelian_produk`
  MODIFY `id_pembelian_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT untuk tabel `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
