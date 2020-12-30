<?php
$filepath = realpath(dirname(__FILE__));
include_once($filepath.'/../lib/Database.php');
include_once($filepath.'/../helpers/Format.php');
 ?>
<?php 


class Seller
{
    private $db;
    private $fm;

    public function __construct()
    {
        $this->db = new Database();
        $this->fm = new Format();
    }

    public function sellerRegistration($data)
    {
        $sellerName       = $this->fm->validation($data['sellerName']);
        $sellerAddress    = $this->fm->validation($data['sellerAddress']);
        $sellerCity       = $this->fm->validation($data['sellerCity']);
        $sellerZip        = $this->fm->validation($data['sellerZip']);
        $sellerEmail      = $this->fm->validation($data['sellerEmail']);
        $sellerCountry    = $this->fm->validation($data['sellerCountry']);
        $sellerPhone      = $this->fm->validation($data['sellerPhone']);
        $sellerPass       = $this->fm->validation($data['sellerPass']);
        
        $sellerName       = mysqli_real_escape_string($this->db->link, $sellerName);
        $sellerAddress    = mysqli_real_escape_string($this->db->link, $sellerAddress);
        $sellerCity       = mysqli_real_escape_string($this->db->link, $sellerCity);
        $sellerZip        = mysqli_real_escape_string($this->db->link, $sellerZip);
        $sellerEmail      = mysqli_real_escape_string($this->db->link, $sellerEmail);
        $sellerCountry    = mysqli_real_escape_string($this->db->link, $sellerCountry);
        $sellerPhone      = mysqli_real_escape_string($this->db->link, $sellerPhone);
        $sellerPass       = mysqli_real_escape_string($this->db->link, md5($sellerPass));

        if ($sellerName == "" || $sellerAddress == "" || $sellerCity == "" || $sellerZip == "" || $sellerEmail == "" || $sellerCountry == "" || $sellerPhone == "" || $sellerPass == "") {
            $msg = "<span class='error'>Fields must not be empty!</span>";
            return $msg;
        }
        $mailquery = "SELECT * FROM tbl_seller WHERE sellerEmail = '$sellerEmail' LIMIT 1";
        $mailchk = $this->db->select($mailquery);
        if ($mailchk != false) {
            $msg = "<span class='error'>Seller Email already Exist!</span>";
            return $msg;
        } else {
            $query = "INSERT INTO tbl_seller(sellerName, sellerAddress, sellerCity, sellerCountry, sellerZip, sellerPhone, sellerEmail, sellerPass) VALUES('$sellerName', '$sellerAddress', '$sellerCity', '$sellerCountry', '$sellerZip', '$sellerPhone', '$sellerEmail', '$sellerPass')";
            $inserted_row = $this->db->insert($query);
            if ($inserted_row) {
                $msg = "<span class='success'>Seller Data Inserted Successfully</span>";
                return $msg;
            } else {
                $msg = "<span class='error'>Seller Data Not Inserted.</span>";
                return $msg;
            }
        }
    }

    public function sellerLogin($data)
    {
        $sellerEmail  = $this->fm->validation($data['sellerEmail']);
        $sellerPass   = $this->fm->validation($data['sellerPass']);

        $sellerEmail  = mysqli_real_escape_string($this->db->link, $sellerEmail);
        $sellerPass   = mysqli_real_escape_string($this->db->link, md5($sellerPass));

        if (empty($sellerEmail) || empty($sellerPass)) {
            $msg = "<span class='error'>Fields must not be empty!</span>";
            return $msg;
        }
        $query = "SELECT * FROM tbl_seller WHERE sellerEmail = '$sellerEmail' AND sellerPass = '$sellerPass'";
        $result = $this->db->select($query);
        if ($result != false) {
            $value = $result->fetch_assoc();
            Session::set("slogin", true);
            Session::set("sId", $value['id']);
            Session::set("sName", $value['sellerName']);
            header("Location:deshboard.php");
        } else {
            $msg = "<span class='error'>sellerEmail or sellerPassowrd not matched!</span>";
            return $msg;
        }
    }

    public function getSellerData($id)
    {
        $query = "SELECT * FROM tbl_seller WHERE id = '$id'";
        $result = $this->db->select($query);
        return $result;
    }

    public function sellerUpdate($data, $sId)
    {
        $sellerName       = $this->fm->validation($data['sellerName']);
        $sellerAddress    = $this->fm->validation($data['sellerAddress']);
        $sellerCity       = $this->fm->validation($data['sellerCity']);
        $sellerZip        = $this->fm->validation($data['sellerZip']);
        $sellerEmail      = $this->fm->validation($data['sellerEmail']);
        $sellerCountry    = $this->fm->validation($data['sellerCountry']);
        $sellerPhone      = $this->fm->validation($data['sellerPhone']);
        
        
        $sellerName       = mysqli_real_escape_string($this->db->link, $sellerName);
        $sellerAddress    = mysqli_real_escape_string($this->db->link, $sellerAddress);
        $sellerCity       = mysqli_real_escape_string($this->db->link, $sellerCity);
        $sellerZip        = mysqli_real_escape_string($this->db->link, $sellerZip);
        $sellerEmail      = mysqli_real_escape_string($this->db->link, $sellerEmail);
        $sellerCountry    = mysqli_real_escape_string($this->db->link, $sellerCountry);
        $sellerPhone      = mysqli_real_escape_string($this->db->link, $sellerPhone);
        

        if ($sellerName == "" || $sellerAddress == "" || $sellerCity == "" || $sellerZip == "" || $sellerEmail == "" || $sellerCountry == "" || $sellerPhone == "") {
            $msg = "<span class='error'>Fields must not be empty!</span>";
            return $msg;
        } else {
            $query = "UPDATE tbl_seller
            SET
            sellerName    = '$sellerName',
            sellerAddress = '$sellerAddress',
            sellerCity    = '$sellerCity',
            sellerCountry = '$sellerCountry',
            sellerZip     = '$sellerZip',
            sellerPhone   = '$sellerPhone',
            sellerEmail   = '$sellerEmail'
            WHERE id = '$sId'";
            $updated_row = $this->db->update($query);
            if ($updated_row) {
                $msg = "<span class='success'>Seller Data Update Successfully</span>";
                return $msg;
            } else {
                $msg = "<span class='error'>Seller Data Not Updated.</span>";
                return $msg;
            }
        }
    }
}
