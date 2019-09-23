<?php

    $con = mysqli_connect('localhost', 'root', '', 'silumanberhitung');

    //cek koneksi
    if (mysqli_connect_errno()){
        echo "1 : koneksi gagal"; //error code #1 = connection failed
        exit();
    }

    $username = $_POST["username"];
    $password = $_POST["password"];
    $konfirmasi = $_POST["konfirmasiPassword"];
    $peran = $_POST["peran"];
    $nama = $_POST["nama"];
    $email = $_POST["email"];

    //cek jika username sudah ada
    $usernameCheckQuery = "SELECT username FROM user WHERE username='". $username . "';";

    $nameCheck = mysqli_query($con, $usernameCheckQuery) or die("2 : query username gagal"); //error code #2 = username check query failed

    if(mysqli_num_rows($nameCheck) > 0){
        echo "3 : Username sudah ada"; //error code #3 = name exist cannot register
        exit();
    }

    if($password != $konfirmasi){
        echo "4 : Konfirmasi password salah"; //error code #4 = wrong password confirmation
        exit(); 
    }

    //add user to the table
    $insertUserQuery = "INSERT INTO user (username, password, peran) values ('" . $username . "', '" . md5($password) . "', '" . $peran . "');";
    mysqli_query($con, $insertUserQuery) or die("5: Insert query user gagal"); //error code #5 = insert user failed
    
    $queryUser = "SELECT idUser FROM user WHERE username = '" . $username . "';";
    $hasilIdUser = mysqli_query($con, $queryUser) or die("7: Select query idUser gagal"); //error code #7 = select user's idUser query failed
    $idUser = mysqli_fetch_assoc($hasilIdUser);

    if ($peran == 0) {
        $insertSkorQuery = "INSERT INTO skor (nilai, benar, salah, menang, kalah) VALUES (0, 0, 0, 0, 0);";
        mysqli_query($con, $insertSkorQuery) or die("6: Insert query skor gagal"); //error code #6 = insert skor query failed
        
        $querySkor = "SELECT idSkor FROM skor WHERE nilai = 0 AND benar = 0 AND salah = 0 AND menang = 0 AND kalah = 0;";
        $hasilIdSkor = mysqli_query($con, $querySkor) or die("8: Select query idskor gagal"); //error code #8 = select skor's idSkor query failed
        $idSkor = mysqli_fetch_assoc($hasilIdSkor);

        $insertPelajarQuery = "INSERT INTO pelajar (nama, email, idUser, idSkor) VALUES ('" . $nama ."', '" . $email . "', '" . $idUser["idUser"] ."', '" . $idSkor["idSkor"] . "');";
        mysqli_query($con, $insertPelajarQuery) or die("8: Insert pelajar gagal"); //error code #8 = Insert pelajar failed
    }else {
        $insertGuruQuery = "INSERT INTO guru (nama, email, idUser) VALUES ('" . $nama . "', '" . $email . "', '" . $queryUser . "');";
        mysqli_query($con, $insertGuruQuery) or die("9: Insert guru gagal"); //error code #9 = Insert guru failed
    }

    echo("0");

?>