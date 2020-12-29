<?php 
$filepath = realpath(dirname(__FILE__));
include($filepath.'/../lib/Session.php');
Session::checkLogin();
include_once($filepath.'/../lib/Database.php');
include_once($filepath.'/../helpers/Format.php');

 ?>
<?php


class DeliveryBoy
{
    private $db;
    private $fm;

    public function __construct()
    {
        $this->db = new Database();
        $this->fm = new Format();
    }

    public function dboyRegistration($data)
    {
        $name       = $this->fm->validation($data['name']);
        $address    = $this->fm->validation($data['address']);
        $city       = $this->fm->validation($data['city']);
        $zip        = $this->fm->validation($data['zip']);
        $email      = $this->fm->validation($data['email']);
        $country    = $this->fm->validation($data['country']);
        $phone      = $this->fm->validation($data['phone']);
        $pass       = $this->fm->validation($data['pass']);
        
        $name       = mysqli_real_escape_string($this->db->link, $name);
        $address    = mysqli_real_escape_string($this->db->link, $address);
        $city       = mysqli_real_escape_string($this->db->link, $city);
        $zip        = mysqli_real_escape_string($this->db->link, $zip);
        $email      = mysqli_real_escape_string($this->db->link, $email);
        $country    = mysqli_real_escape_string($this->db->link, $country);
        $phone      = mysqli_real_escape_string($this->db->link, $phone);
        $pass       = mysqli_real_escape_string($this->db->link, md5($pass));

        if ($name == "" || $address == "" || $city == "" || $zip == "" || $email == "" || $country == "" || $phone == "" || $pass == "") {
            $msg = "<span class='error'>Fields must not be empty!</span>";
            return $msg;
        }
        $mailquery = "SELECT * FROM tbl_deliveryboys WHERE email = '$email' LIMIT 1";
        $mailchk = $this->db->select($mailquery);
        if ($mailchk != false) {
            $msg = "<span class='error'>Email already Exist!</span>";
            return $msg;
        } else {
            $query = "INSERT INTO tbl_deliveryboys(name, address, city, country, zip, phone, email, pass) VALUES('$name', '$address', '$city', '$country', '$zip', '$phone', '$email', '$pass')";
            $inserted_row = $this->db->insert($query);
            if ($inserted_row) {
                $msg = "<span class='success'>Delivery Boy Data Inserted Successfully. Please Wait for dboy Confirmation. Or Contact with dboy</span>";
                return $msg;
            } else {
                $msg = "<span class='error'>Delivery Boy Data Is Not Inserted Properly. Please Try Again.</span>";
                return $msg;
            }
        }
    }

    public function dboyLogin($dboyEmail, $dboyPass)
    {
        $dboyEmail = $this->fm->validation($dboyEmail);
        $dboyPass = $this->fm->validation($dboyPass);
        $dboyEmail = mysqli_real_escape_string($this->db->link, $dboyEmail);
        $dboyPass = mysqli_real_escape_string($this->db->link, $dboyPass);

        if (empty($dboyEmail) || empty($dboyPass)) {
            $loginmsg = "Emailname or Password must not be empty!";
            return $loginmsg;
        } else {
            $query = "SELECT * FROM tbl_deliveryboys WHERE dboyEmail = '$dboyEmail' AND dboyPass = '$dboyPass'";
            $result = $this->db->select($query);
            if ($result != false) {
                $value = $result->fetch_assoc();
                Session::set("dboylogin", true);
                Session::set("dboyId", $value['dboyId']);
                Session::set("dboyAddress", $value['dboyAddress']);
                Session::set("dboyCity", $value['dboyCity']);
                Session::set("dboyCountry", $value['dboyCountry']);
                Session::set("dboyZip", $value['dboyZip']);
                Session::set("dboyPhone", $value['dboyPhone']);
                Session::set("dboyEmail", $value['dboyEmail']);
                Session::set("dboyName", $value['dboyName']);
                header("Location:dashboard.php");
            } else {
                $loginmsg = "Emailname or Password not match!";
                return $loginmsg;
            }
        }
    }

    public function getdboyData($id)
    {
        $query = "SELECT * FROM tbl_deliveryboys WHERE id = '$id'";
        $result = $this->db->select($query);
        return $result;
    }

    public function dboyUpdate($data, $dboyId)
    {
        $name       = $this->fm->validation($data['name']);
        $address    = $this->fm->validation($data['address']);
        $city       = $this->fm->validation($data['city']);
        $zip        = $this->fm->validation($data['zip']);
        $email      = $this->fm->validation($data['email']);
        $country    = $this->fm->validation($data['country']);
        $phone      = $this->fm->validation($data['phone']);
        
        
        $name       = mysqli_real_escape_string($this->db->link, $name);
        $address    = mysqli_real_escape_string($this->db->link, $address);
        $city       = mysqli_real_escape_string($this->db->link, $city);
        $zip        = mysqli_real_escape_string($this->db->link, $zip);
        $email      = mysqli_real_escape_string($this->db->link, $email);
        $country    = mysqli_real_escape_string($this->db->link, $country);
        $phone      = mysqli_real_escape_string($this->db->link, $phone);
        

        if ($name == "" || $address == "" || $city == "" || $zip == "" || $email == "" || $country == "" || $phone == "") {
            $msg = "<span class='error'>Fields must not be empty!</span>";
            return $msg;
        } else {
            $query = "UPDATE tbl_deliveryboys
            SET
            name    = '$name',
            address = '$address',
            city    = '$city',
            country = '$country',
            zip     = '$zip',
            phone   = '$phone',
            email   = '$email'
            WHERE id = '$dboyId'";
            $updated_row = $this->db->update($query);
            if ($updated_row) {
                $msg = "<span class='success'>dboy Data Update Successfully</span>";
                return $msg;
            } else {
                $msg = "<span class='error'>dboy Data Not Updated.</span>";
                return $msg;
            }
        }
    }
}
