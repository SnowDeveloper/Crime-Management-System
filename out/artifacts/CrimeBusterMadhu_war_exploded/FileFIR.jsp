<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head profile="http://gmpg.org/xfn/11">
    <title>Crime Buster</title>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
    <meta http-equiv="imagetoolbar" content="no"/>
    <link rel="stylesheet" href="styles/layout.css" type="text/css"/>
    <script type="text/javascript" src="scripts/jquery-1.4.1.min.js"></script>
    <script type="text/javascript" src="scripts/jquery.waterwheelCarousel.js"></script>
    <script type="text/javascript" src="scripts/jquery.waterwheelCarousel.setup.js"></script>

    <style>
        .placeholder::-webkit-input-placeholder {
            color: #da4f49;
        }

        .placeholder::-webkit-input-placeholder {
            color: #da4f49;
        }

        .placeholder::-moz-placeholder {
            color: #da4f49;
        }

        .placeholder::-moz-placeholder {
            color: #da4f49;
        }

        .placeholder::-ms-input-placeholder {
            color: #da4f49;
        }
    </style>
</head>
<body id="top">
<div class="wrapper col1">
    <div id="header">
        <div class="fl_left">
            <h1><a href="index.jsp">Crime Buster</a></h1>

            <p style="color:white">BE SAFE..BE SECURE..</p>
        </div>
        <div class="fl_right"><a href="#"><img src="images/demo/main.jpg" alt=""/></a></div>
        <br class="clear"/>
    </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col2">
    <div id="topbar">
        <div id="topnav">
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="#">Register Complaints</a>
                    <ul>
                        <li><a href="WomenCell.jsp">Women's Cell</a></li>
                        <li><a href="GeneralReport.jsp">General Report</a></li>
                        <li><a href="NoCrimeCertificate.jsp">No Crime Certificate</a></li>
                    </ul>
                </li>
                <li><a href="PoliceTeam.jsp">Police Team</a>
                </li>
                <li class="active"><a href="FileFIR.jsp">File FIR</a></li>
                <li><a href="ContactPolice.jsp">Contact Police</a></li>
            </ul>
        </div>
        <div id="search" style="color:red">
            <h6>Toll Free Number (100)</h6>
        </div>
        <br class="clear"/>
    </div>
</div>


<div class="wrapper col3">
    <div id="breadcrumb">
        <ul>
            <li class="first">You Are Here</li>
            <li>&#187;</li>
            <li><a href="index.jsp">Home</a></li>
            <li>&#187;</li>
            <li class="current"><a href="FileFIR.jsp">File FIR</a></li>
        </ul>
    </div>
</div>


<div class="wrapper col4">
    <div id="container">
        <div id="content">
            <div name="FIRComplaint"><h1 style="color:white">Submit Complaint (FIR)</h1></div>
            <form name="firForm" action="firservlet" method="post" onsubmit="return(validateF());">
                <p align="center-left">
                    <input id="TheName" type="text" placeholder="Full Name" name="name" size="100">
                </p>

                <p align="center-left">
                    <input id="TheEmail" type="text" placeholder="Email Address" name="email" size="100">
                </p>

                <p align="center-left">
                    <input id="TheAge" type="number" placeholder="Age" name="age" size="100">
                </p>

                <p align="center-left">
                    <label>Select Complaint Type: </label>
                    <label>
                        <select id="TheOption" name="option">
                            <option value=""><---Select---></option>
                            <%
                                Class.forName("org.sqlite.JDBC").newInstance();
                                Connection con = DriverManager.getConnection("jdbc:sqlite:C:/sqlite/wcomplaint");
                                PreparedStatement psmnt = con.prepareStatement("select type from firtype ");
                                ResultSet results = psmnt.executeQuery();
                                while (results.next()) {
                                    String name = results.getString(1);
                            %>
                            <option value="<%= name %>"><%=name%>
                            </option>
                            <%
                                }
                                results.close();
                                psmnt.close();
                            %>
                        </select>
                    </label><br>
                </p>
                <p align="center-left">
                    <input id="ThePhoneNumber" type="tel" placeholder="Phone Number" name="num" size="100">
                </p>

                <p align="center-left">
                    <textarea id="TheAddress" cols="98" rows="5" placeholder="Address" name="add"></textarea>
                </p>

                <p align="center-left">
                    <textarea id="TheDetails" cols="98" rows="8" placeholder="Detailed Incident (Describe Here)"
                              name="detail"></textarea>
                </p>

                <div class="clear"></div>
                <div class="row">
                    <div style="text-align: center;">
                        <button type="submit">Submit Form</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <div id="column">
        <div class="subnav">
            <h2 style="color:white">Check Reference Number Details (FIR Only)</h2>
            <li>FIR Cases are Resolved Within 15 Days!</li>
            <br><br>

            <form name="firfrm" action="FIRReferenceServlet" method="post" onsubmit="return(validateForm());">
                <div class="row">
                    <input id="TheRefNo" type="text" placeholder="Reference No. (XXXXXXX)" name="ref" size="40"></br>
                </div>
                <br>

                <div class="row">
                    <div style="text-align: center;">
                        <button type="submit">Submit</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <br class="clear"/>
</div>
</div>
<br><br>
<!-- ####################################################################################################### -->
<div class="wrapper col5">

</div>

<!-- ####################################################################################################### -->

<div class="wrapper col6">
    <div id="copyright" align="center">
        <p>Copyright@ 2015: Crime Buster</p><br>

        <p>All Rights Reserved</p>
        <br class="clear"/>
    </div>
</div>

<script type="text/javascript">
    function validateF() {
        var name = document.firForm.name.value;
        var email = document.firForm.email.value;
        var age = document.firForm.age.value;
        var option = document.firForm.option.value;
        var phonenum = document.firForm.num.value;
        var addr = document.firForm.add.value;
        var detail = document.firForm.detail.value;

        if (name == null || name == "") {
            $("#TheName").attr("value", "");
            $("#TheName").attr("placeholder", "Name Not Filled");
            $("#TheName").addClass("placeholder");
            $('html, body').animate({
                scrollTop: $("#TheName").offset().top
            }, 'slow');
            return false;
        }
        if (email == null || email == "" || email.indexOf("@") == -1 || email.indexOf(".") == -1) {
            $("#TheEmail").attr("value", "");
            $("#TheEmail").attr("placeholder", "Email Not Filled");
            $("#TheEmail").addClass("placeholder");
            $('html, body').animate({
                scrollTop: $("#TheEmail").offset().top
            }, 'slow');
            return false;
        }
        if (age == null || age == "" || isNaN(age) || age < 10 || age > 100) {
            $("#TheAge").attr("value", "");
            $("#TheAge").attr("placeholder", "Age Not Filled");
            $("#TheAge").addClass("placeholder");
            $('html, body').animate({
                scrollTop: $("#TheAge").offset().top
            }, 'slow');
            return false;
        }
        if (phonenum == null || phonenum == "" || isNaN(phonenum) || phonenum.length < 10) {
            $("#ThePhoneNumber").attr("value", "");
            $("#ThePhoneNumber").attr("placeholder", "Contact Not Filled and should be of 10 digits");
            $("#ThePhoneNumber").addClass("placeholder");
            $('html, body').animate({
                scrollTop: $("#ThePhoneNumber").offset().top
            }, 'slow');
            return false;
        }
        if (addr == null || addr == "") {
            $("#TheAddress").attr("value", "");
            $("#TheAddress").attr("placeholder", "Address must be filled out");
            $("#TheAddress").addClass("placeholder");
            $('html, body').animate({
                scrollTop: $("#TheAddress").offset().top
            }, 'slow');
            return false;
        }
        if (detail == null || detail == "") {
            $("#TheDetails").attr("value", "");
            $("#TheDetails").attr("placeholder", "Details must be filled out");
            $("#TheDetails").addClass("placeholder");
            $('html, body').animate({
                scrollTop: $("#TheDetails").offset().top
            }, 'slow');
            return false;
        }

        $.ajax({
            type: "POST",
            url: "/firservlet",
            data: {
                _name: name,
                _email: email,
                _age: age,
                _option: option,
                _phonenum: phonenum,
                _addr: addr,
                _detail: detail
            },
            success: function (data) {
                $('form[name="firForm"]').trigger("reset");
                $('form[name="firForm"]').closest("form").hide();
                $('div[name="FIRComplaint"]').closest("div").text(data);
                $('div[name="FIRComplaint"]').closest("div").append("<br><br><a onclick='return(ReForm());'>Click Here for New Complaint</a>");
            }
        });
        return false;
    }
</script>
<script type="text/javascript">
    function ReForm() {
        $('form[name="firForm"]').closest("form").trigger("reset");
        $('form[name="firForm"]').closest("form").show();
        $('div[name="FIRComplaint"]').closest("div").text("Enter Details");
    }
</script>

<script type="text/javascript">
    function validateForm() {

        var ref = document.firfrm.ref.value;

        if (ref == null || ref == "" || isNaN(ref)) {
            $("#TheRefNo").attr("value", "")
            $("#TheRefNo").attr("placeholder", "Ref. No. must be filled out")
            $("#TheRefNo").addClass("placeholder")
            $('html, body').animate({
                scrollTop: $("#TheRefNo").offset().top
            }, 'slow');
            return false;
        }
        $.ajax({
            type: "POST",
            url: "/FIRReferenceServlet",
            data: {_ref: ref},
            success: function (data) {
                var dataSplit = data.split(";");
                $('form[name="firForm"]').closest("form").hide();
                $('div[name="FIRComplaint"]').closest("div").html("<h1>Your Complaint Details:</h1><br><br>");
                if (dataSplit.length > 1) {
                    $('div[name="FIRComplaint"]').append("Your Name: " + dataSplit[0] + " and your Email id is: " + dataSplit[1]);
                    $('div[name="FIRComplaint"]').append("<br><br> Your details are successfully recorded into our System - CrimeBuster.");
                    $('div[name="FIRComplaint"]').append("<br><br> The complaint is Under Processing and will be resolved in 15 days!");
                    $('div[name="FIRComplaint"]').append("<br><br>Kindly Come to the nearest Police Station with your Reference Number and other proofs. <br>For Nearest Police Station click on <a href='ContactPolice.jsp'> 'Contact Police'</a> section.");
                }
                else {
                    $('div[name="FIRComplaint"]').append("Invalid Reference No.!<br><br>Try Again!");
                }
                $('div[name="FIRComplaint"]').closest("div").append("<br><br><br><br><a onclick='return(ReForm());'>Click Here For New Complaint</a>");
            }
        });
        return false;

    }
</script>


</body>
</html>
