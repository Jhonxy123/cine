<?php
include_once'conexion.php';
$obj = new Conexion();
$link = $obj->Conectar();

$id=(isset($_POST['id_emp']))?$_POST['id_emp']:'';
$tipo_emp=(isset($_POST['tipo_emp']))?$_POST['tipo_emp']:'';
$nomb=(isset($_POST['nomb_emp']))?$_POST['nomb_emp']:'';
$cedula=(isset($_POST['cedula_emp']))?$_POST['cedula_emp']:'';
$usario=(isset($_POST['usuario']))?$_POST['usuario']:'';
$tel=(isset($_POST['tel_emp']))?$_POST['tel_emp']:'';
$password=(isset($_POST['pass']))?$_POST['pass']:'';
$opc=(isset($_POST['opc']))?$_POST['opc']:'';

switch($opc){
    case 1:
        $sql="INSERT INTO empleado(id_empleado, id_tipo_empleado, nombre, cedula, usuario, telefono, contrasena) 
        VALUES ($id,$tipo_emp,$nomb,$cedula,$usuario,$tel,$password";
        $res=$link->prepare($sql);
        $res->execute();

        $sql="select * from empleado order by id_a DESC limit 1";
        $res=$link->prepare($sql);
        $res->execute();
        $data=$res->fetchAll(PDO::FETCH_ASSOC);
    break;
    case 2:
        $sql="UPDATE empleado SET id_empleado=$id,id_tipo_empleado=$tipo_emp,nombre=$nomb,cedula=$cedula,
        usuario=$usuario,telefono=$tel,contrasena=$password WHERE id_empleado=$id";
         $res=$link->prepare($sql);
         $res->execute();
         
         $sql="select * from empleado order by id_a DESC limit 1";
         $res=$link->prepare($sql);
         $res->execute();
         $data=$res->fetchAll(PDO::FETCH_ASSOC);
    break;
    case 3:
        $sql="delete from empleado where id_empleado = $id";
        $res=$link->prepare($sql);
        $res->execute();
    break;    
    case 4:
        $sql="select * from empleado";
        $res=$link->prepare($sql);
        $res->execute();
        $data=$res->fetchAll(PDO::FETCH_ASSOC);
    break;
}
print json_encode($data,JSON_UNESCAPED_UNICODE);
$link=null;
?>