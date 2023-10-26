<?php
session_start();

require "./databases/db-connect.php";

function changeDateTime($inputDate){
    $date = new DateTime($inputDate);
    $formattedDate = $date->format('d F Y H:i:s');
    return $formattedDate;
}

$page = (isset($_GET['page']) ? $page = $_GET['page'] : $_GET = "home");

if(!isset($_SESSION['loggedin']) || $_SESSION['loggedin'] !== true){
    $page = "login";
}

switch ($page) {
    
    // Starter
    case "login" :
        require __DIR__ . '/views/auth/login.php';
        break;

    case "home" :
        $pageName = "Dashboard";
        include './views/components/header.php';
        require __DIR__ . '/views/home.php';
        include './views/components/footer.php';
        break;

    // Stock
    case "order":
        $pageName = "Order";
        include './views/components/header.php';
        require __DIR__ . '/views/stock/order.php';
        include './views/components/footer.php';
        break;

    case "rawMaterial_manage":
        $pageName = "Raw Material | Management";
        include './views/components/header.php';
        require __DIR__ . '/views/stock/rawMaterial/manage.php';
        include './views/components/footer.php';
        break;
    case "rawMaterial_unit":
        $pageName = "Raw Material | Unit";
        include './views/components/header.php';
        require __DIR__ . '/views/stock/rawMaterial/unit.php';
        include './views/components/footer.php';
        break;
    case "rawMaterial_type":
        $pageName = "Raw Material | Type";
        include './views/components/header.php';
        require __DIR__ . '/views/stock/rawMaterial/type.php';
        include './views/components/footer.php';
        break;

    case "menu":
        $pageName = "Menu";
        include './views/components/header.php';
        require __DIR__ . '/views/stock/menu.php';
        include './views/components/footer.php';
        break;

    // Employee

    case "employee":
        $pageName = "Employee";
        include './views/components/header.php';
        require __DIR__ . '/views/employee/employee.php';
        include './views/components/footer.php';
        break;

    // 404

    default:
        http_response_code(404);
        require __DIR__ . '/views/404.php';
        break;
        // echo __DIR__ . '/views/404.php';
        // exit;
}
?>