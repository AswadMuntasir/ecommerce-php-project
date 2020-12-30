<?php
$filepath = realpath(dirname(__FILE__));
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
        $dboyName       = $this->fm->validation($data['dboyName']);
        $dboyAddress    = $this->fm->validation($data['dboyAddress']);
        $dboyCity       = $this->fm->validation($data['dboyCity']);
        $dboyZip        = $this->fm->validation($data['dboyZip']);
        $dboyEmail      = $this->fm->validation($data['dboyEmail']);
        $dboyCountry    = $this->fm->validation($data['dboyCountry']);
        $dboyPhone      = $this->fm->validation($data['dboyPhone']);
        $dboyPass       = $this->fm->validation($data['dboyPass']);
        
        $dboyName       = mysqli_real_escape_string($this->db->link, $dboyName);
        $dboyAddress    = mysqli_real_escape_string($this->db->link, $dboyAddress);
        $dboyCity       = mysqli_real_escape_string($this->db->link, $dboyCity);
        $dboyZip        = mysqli_real_escape_string($this->db->link, $dboyZip);
        $dboyEmail      = mysqli_real_escape_string($this->db->link, $dboyEmail);
        $dboyCountry    = mysqli_real_escape_string($this->db->link, $dboyCountry);
        $dboyPhone      = mysqli_real_escape_string($this->db->link, $dboyPhone);
        $dboyPass       = mysqli_real_escape_string($this->db->link, md5($dboyPass));

        if ($dboyName == "" || $dboyAddress == "" || $dboyCity == "" || $dboyZip == "" || $dboyEmail == "" || $dboyCountry == "" || $dboyPhone == "" || $dboyPass == "") {
            $msg = "<span class='error'>Fields must not be empty!</span>";
            return $msg;
        }
        $mailquery = "SELECT * FROM tbl_deliveryboys WHERE dboyEmail = '$dboyEmail' LIMIT 1";
        $mailchk = $this->db->select($mailquery);
        if ($mailchk != false) {
            $msg = "<span class='error'>Delivery Boy Email already Exist!</span>";
            return $msg;
        } else {
            $query = "INSERT INTO tbl_deliveryboys(dboyName, dboyAddress, dboyCity, dboyCountry, dboyZip, dboyPhone, dboyEmail, dboyPass) VALUES('$dboyName', '$dboyAddress', '$dboyCity', '$dboyCountry', '$dboyZip', '$dboyPhone', '$dboyEmail', '$dboyPass')";
            $inserted_row = $this->db->insert($query);
            if ($inserted_row) {
                $msg = "<span class='success'>Delivery Boy Data Inserted Successfully</span>";
                return $msg;
            } else {
                $msg = "<span class='error'>Delivery Boy Data Not Inserted.</span>";
                return $msg;
            }
        }
    }

    public function dboyLogin($data)
    {
        $dboyEmail  = $this->fm->validation($data['dboyEmail']);
        $dboyPass   = $this->fm->validation($data['dboyPass']);

        $dboyEmail  = mysqli_real_escape_string($this->db->link, $dboyEmail);
        $dboyPass   = mysqli_real_escape_string($this->db->link, md5($dboyPass));

        if (empty($dboyEmail) || empty($dboyPass)) {
            $msg = "<span class='error'>Fields must not be empty!</span>";
            return $msg;
        }
        $query = "SELECT * FROM tbl_deliveryboys WHERE dboyEmail = '$dboyEmail' AND dboyPass = '$dboyPass'";
        $result = $this->db->select($query);
        if ($result != false) {
            $value = $result->fetch_assoc();
            Session::set("dlogin", true);
            Session::set("dId", $value['dboyId']);
            Session::set("dName", $value['dboyName']);
            header("Location:deshboard.php");
        } else {
            $msg = "<span class='error'>Delivery Boy Email or Delivery Boy Passowrd not matched!</span>";
            return $msg;
        }
    }

    public function getDeliveryBoyData($id)
    {
        $query = "SELECT * FROM tbl_deliveryboys WHERE dboyid = '$id'";
        $result = $this->db->select($query);
        return $result;
    }

    public function dboyUpdate($data, $dId)
    {
        $dboyName       = $this->fm->validation($data['dboyName']);
        $dboyAddress    = $this->fm->validation($data['dboyAddress']);
        $dboyCity       = $this->fm->validation($data['dboyCity']);
        $dboyZip        = $this->fm->validation($data['dboyZip']);
        $dboyEmail      = $this->fm->validation($data['dboyEmail']);
        $dboyCountry    = $this->fm->validation($data['dboyCountry']);
        $dboyPhone      = $this->fm->validation($data['dboyPhone']);
        
        
        $dboyName       = mysqli_real_escape_string($this->db->link, $dboyName);
        $dboyAddress    = mysqli_real_escape_string($this->db->link, $dboyAddress);
        $dboyCity       = mysqli_real_escape_string($this->db->link, $dboyCity);
        $dboyZip        = mysqli_real_escape_string($this->db->link, $dboyZip);
        $dboyEmail      = mysqli_real_escape_string($this->db->link, $dboyEmail);
        $dboyCountry    = mysqli_real_escape_string($this->db->link, $dboyCountry);
        $dboyPhone      = mysqli_real_escape_string($this->db->link, $dboyPhone);
        

        if ($dboyName == "" || $dboyAddress == "" || $dboyCity == "" || $dboyZip == "" || $dboyEmail == "" || $dboyCountry == "" || $dboyPhone == "") {
            $msg = "<span class='error'>Fields must not be empty!</span>";
            return $msg;
        } else {
            $query = "UPDATE tbl_deliveryboys
            SET
            dboyName    = '$dboyName',
            dboyAddress = '$dboyAddress',
            dboyCity    = '$dboyCity',
            dboyCountry = '$dboyCountry',
            dboyZip     = '$dboyZip',
            dboyPhone   = '$dboyPhone',
            dboyEmail   = '$dboyEmail'
            WHERE dboyId = '$dId'";
            $updated_row = $this->db->update($query);
            if ($updated_row) {
                $msg = "<span class='success'>Delivery Boy Data Update Successfully</span>";
                return $msg;
            } else {
                $msg = "<span class='error'>Delivery Boy Data Not Updated.</span>";
                return $msg;
            }
        }
    }

    public function delDById($id)
    {
        $delquery = "DELETE FROM tbl_deliveryboys WHERE dboyId = '$id'";
        $deldata = $this->db->delete($delquery);
        if ($deldata) {
            $msg = "<span class='success'>Delivery Boy Deleted Successfully</span>";
            return $msg;
        } else {
            $msg = "<span class='error'>Delivery Boy Not Deleted!</span>";
            return $msg;
        }
    }
}
