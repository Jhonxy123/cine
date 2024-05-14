<?php
include_once'conexion.php';
$obj = new Conexion();
$link = $obj->Conectar();

$cedula=(isset($_POST['cedula_cli']))?$_POST['cedula_cli']:'';
$nombre=(isset($_POST['nom_cli']))?$_POST['nomb_cli']:'';
$tel=(isset($_POST['tel_cli']))?$_POST['tel_cli']:'';
$fecha_nac=(isset($_POST['fecha_nac']))?$_POST['fecha_nac']:'';
$em=(isset($_POST['email_cli']))?$_POST['email_cli']:'';
$password=(isset($_POST['pass']))?$_POST['pass']:'';
$opc=(isset($_POST['opc']))?$_POST['opc']:'';

switch($opc){
    case 1:
        $sql="INSERT INTO cliente(cedula, nombre, telefono, fecha_nac, correo, contrasena) 
        VALUES ($cedula,$nombre,$tel,$fecha_nac,$em,$password)";
        $res=$link->prepare($sql);
        $res->execute();

        $sql="select * from cliente order by id_a DESC limit 1";
        $res=$link->prepare($sql);
        $res->execute();
        $data=$res->fetchAll(PDO::FETCH_ASSOC);
    break;
    case 2:
        $sql="UPDATE cliente SET cedula=$cedula,nombre=$nombre,telefono=$tel,fecha_nac=$fecha_nac,
        correo=$em,contrasena=$password WHERE cedula=$cedula";
         $res=$link->prepare($sql);
         $res->execute();
         
         $sql="select * from cliente order by id_a DESC limit 1";
         $res=$link->prepare($sql);
         $res->execute();
         $data=$res->fetchAll(PDO::FETCH_ASSOC);
    break;
    case 3:
        $sql="delete from cliente where cedula = $cedula";
        $res=$link->prepare($sql);
        $res->execute();
    break;    
    case 4:
        $sql="select * from cliente";
        $res=$link->prepare($sql);
        $res->execute();
        $data=$res->fetchAll(PDO::FETCH_ASSOC);
    break;
    }
print json_encode($data,JSON_UNESCAPED_UNICODE);
$link=null;
?>