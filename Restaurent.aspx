<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Restaurent.aspx.cs" Inherits="Restaurent" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Nitai Ltd :: Restaurant</title>
    <meta name="keywords" content="Weighbridge in Kenya, Nairobi, Weighbridge Software, Unmanned Weighbridge Software, Weighing Scale Kenya, Weighbridge Kenya, Weighbridge Uganda, Weighbridge Tanzania, Weighbridge Burundi, Weighbridge Rwanda, Weighbridge South sudan, Weighbridge Ethopia, Weighbridge Congo, RFID Weighbridge Software, Weighbridge Software With CCTV and Auto Email, Time Attendance, Online Payroll, Desktop Payroll, Payroll, Tally.ERP 9, Tally Kenya, Online Weighbridge Software, Online Weighbride Reporting,Online Weighbridge, E-Reporting, Website Development, Android Application Development, Digital Load Cell, Digital Indicator">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Weighbridge, Weighbridge in Kenya, Nairobi, Weighbridge Software, Unmanned Weighbridge Software, Weighing Scale Kenya, Weighbridge Kenya, Weighbridge Uganda, Weighbridge Tanzania, Weighbridge Burundi, Weighbridge Rwanda, Weighbridge South sudan, Weighbridge Ethopia, Weighbridge Congo, RFID Weighbridge Software, Weighbridge Software With CCTV and Auto Email, Time Attendance, Online Payroll, Desktop Payroll, Payroll, Tally.ERP 9, Tally Kenya, Online Weighbridge Software, Online Weighbride Reporting,Online Weighbridge, E-Reporting, Website Development, Android Application Development, Digital Load Cell, Digital Indicator">
    <meta name="author" content="Rajesh Solanki">
    <meta name="copyright" content="Nitai Ltd.">
    <meta name="rating" content="general">
    <meta name="distribution" content="Global">
    <meta name="Channel" content="Weighing Scale, Weighbridge, Weighbridge Software Kenya, Dubai, Uganda, Ethopia, Tanzania, Burundi, Rwanda, South sudan, Congo.">
    <meta name="subject" content="Weighbridge Software Kenya.">
    <meta name="generator" content="www.nitaibalance.co.uk">
    <meta name="robots" content="All">
    <meta http-equiv="Reply-to" content="rs@nitaibalance.co.uk">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7">

    <link href="favicon.ico" rel="shortcut icon" type="image/x-icon" style="width: auto" />
    <link href="favicon.ico" rel="icon" type="image/x-icon" style="width: auto" />

    <link id="callCss" rel="stylesheet" href="themes/current/bootstrap.min.css" type="text/css" media="screen" />
    <link href="themes/css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css">
    <link href="themes/css/font-awesome.css" rel="stylesheet" type="text/css">
    <link href="themes/css/base.css" rel="stylesheet" type="text/css">
    <style type="text/css" id="enject"></style>
    <script type="text/javascript">
        function preventBack() { window.history.forward(); }
        setTimeout("preventBack()", 0);
        window.onunload = function () { null };
    </script>
</head>
<body oncontextmenu="return false">
    <section id="headerSection">
        <div class="container">
            <div class="navbar">
                <div class="container">
                    <button type="button" class="btn btn-navbar active" data-toggle="collapse" data-target=".nav-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <div class="nav-collapse collapse">
                        <ul class="nav pull-right">
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Page banner -->
    <section id="bannerSection" style="background-color: black">
        <div class="container">
            <h1 id="pageTitle">
                <img src="images/logo/Nitai_White.png" draggable="false" width="100px" title="Nitai Ltd." />
                Restaurant<br />
            </h1>
        </div>
    </section>
    <form id="form1" runat="server">
        <section id="bodySection">
            <div class="container">
                <div class="row">
                </div>
                <div class="span3">
                </div>
                <div class="span5">
                    <div class="thumbnail" style="background-color: #c0eaff">
                        <h3>Restaurant</h3>
                        <div class="row">
                            <br />
                            <div class="span5">
                                <div class="control-group">
                                    <div class="controls">
                                        <table>
                                            <tr>
                                                <td><b>Table No :</b></td>
                                                <td>
                                                    <asp:DropDownList ID="cmbTable_Name" CssClass="span3" runat="server">
                                                        <asp:ListItem Selected="True">Table 1</asp:ListItem>
                                                        <asp:ListItem>Table 2</asp:ListItem>
                                                        <asp:ListItem>Table 3</asp:ListItem>
                                                        <asp:ListItem>Table 4</asp:ListItem>
                                                        <asp:ListItem>Table 5</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><b>Item Name :</b></td>
                                                <td>
                                                    <asp:DropDownList ID="cmbItem_Name" CssClass="span3" runat="server">
                                                        <asp:ListItem Selected="True">Item 1</asp:ListItem>
                                                        <asp:ListItem>Item 2</asp:ListItem>
                                                        <asp:ListItem>Item 3</asp:ListItem>
                                                        <asp:ListItem>Item 4</asp:ListItem>
                                                        <asp:ListItem>Item 5</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="TextBox1" CssClass="span1" runat="server" placeholder="Qty"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><b></b></td>
                                                <td>
                                                    <asp:DropDownList ID="DropDownList2" CssClass="span3" runat="server">
                                                        <asp:ListItem>Item 1</asp:ListItem>
                                                        <asp:ListItem Selected="True">Item 2</asp:ListItem>
                                                        <asp:ListItem>Item 3</asp:ListItem>
                                                        <asp:ListItem>Item 4</asp:ListItem>
                                                        <asp:ListItem>Item 5</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="TextBox2" CssClass="span1" runat="server" placeholder="Qty"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><b></b></td>
                                                <td>
                                                    <asp:DropDownList ID="DropDownList1" CssClass="span3" runat="server">
                                                        <asp:ListItem>Item 1</asp:ListItem>
                                                        <asp:ListItem>Item 2</asp:ListItem>
                                                        <asp:ListItem Selected="True">Item 3</asp:ListItem>
                                                        <asp:ListItem>Item 4</asp:ListItem>
                                                        <asp:ListItem>Item 5</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="TextBox3" CssClass="span1" runat="server" placeholder="Qty"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><b></b></td>
                                                <td>
                                                    <asp:DropDownList ID="DropDownList3" CssClass="span3" runat="server">
                                                        <asp:ListItem>Item 1</asp:ListItem>
                                                        <asp:ListItem>Item 2</asp:ListItem>
                                                        <asp:ListItem>Item 3</asp:ListItem>
                                                        <asp:ListItem Selected="True">Item 4</asp:ListItem>
                                                        <asp:ListItem>Item 5</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="TextBox4" CssClass="span1" runat="server" placeholder="Qty"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><b></b></td>
                                                <td>
                                                    <asp:DropDownList ID="DropDownList4" CssClass="span3" runat="server">
                                                        <asp:ListItem>Item 1</asp:ListItem>
                                                        <asp:ListItem>Item 2</asp:ListItem>
                                                        <asp:ListItem>Item 3</asp:ListItem>
                                                        <asp:ListItem>Item 4</asp:ListItem>
                                                        <asp:ListItem Selected="True">Item 5</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="TextBox5" CssClass="span1" runat="server" placeholder="Qty"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><b>Amount :</b></td>
                                                <td>
                                                    <asp:TextBox ID="txtAmount" CssClass="span3" runat="server" Enabled="false" placeholder="Total Amount...."></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br />
                    <asp:Button ID="btnSelect_Month" CssClass="btn btn-success" runat="server" Text="Save Order" />
                    <asp:Button ID="btnClose_Month" CssClass="btn btn-info" runat="server" Text="Clear Order" />
                    <asp:Button ID="btnClose_Year" CssClass="btn btn-success" runat="server" Text="Pay" />
                </div>
            </div>
        </section>
    </form>
    <br />
    <br />
    <!-- Inquiry From End -->

    <!-- Footer
  ================================================== -->
    <section id="footerSection">
        <div class="container">
            <footer class="footer well well-small">
                <div class="row-fluid">
                    <div class="span3">
                        <h4>How Nitai Works?</h4>
                        <h5>Services</h5>
                        <ul>
                            <li type="none">Better Customer Services</li>
                            <li type="none">Customer Satisfaction</li>
                            <li type="none">Our Edge</li>
                            <li type="none">General Interest</li>
                            <li type="none">Theme</li>
                            <li type="none">Contact us</li>
                            <li type="none">Other Services</li>
                        </ul>
                        <h5>Quick Links</h5>
                        <ul>
                            <li type="none"><a href="http://www.nitaibalance.co.uk/support.aspx" title="Support"><i class="icon-cogs"></i>Support </a></li>
                            <li type="none"><a href="http://www.nitaibalance.co.uk/Aboutus.aspx" title="About us"><i class="icon-info-sign"></i>About us </a></li>
                            <li type="none"><a href="http://www.nitaibalance.co.ukcontact.aspx" title="Contact"><i class="icon-question-sign"></i>Contact </a></li>
                        </ul>
                    </div>
                    <br />
                    <br />
                    <div class="span3">
                        <h5>Products</h5>
                        <ul class="link">
                            <li type="none"><a href="http://www.nitaibalance.co.uk/WeighingScale.aspx" title="Weighing Scale">Weighing Scale</a></li>
                            <li type="none"><a href="http://www.nitaibalance.co.uk/Weighbridge.aspx" title="Weighbridge Software">Imagic Weighbridge Software</a></li>
                            <li type="none"><a href="http://www.nitaibalance.co.uk/BulkLoadingSystem.aspx" title="Bulk Loading System">Bulk Loading System</a></li>
                            <li type="none"><a href="http://www.nitaibalance.co.uk/TAandPayroll.aspx" title="Payroll Software">Imagic Payroll Software</a></li>
                            <li type="none"><a href="http://www.nitaibalance.co.uk/TAandPayroll.aspx" title="Time Attendance">Imagic Time Attendance Software</a></li>
                            <li type="none"><a href="http://www.nitaibalance.co.uk/DigitalLoadCell.aspx" title="Digital Load Cell">Digital Load Cell</a></li>
                            <li type="none"><a href="http://www.nitaibalance.co.uk/Digital_indicator.aspx" title="Digital Indicator">Digital Inidicator</a></li>
                            <li type="none"><a href="http://www.nitaibalance.co.uk/Tally.aspx" title="Tally.ERP 9">Tally.ERP 9</a></li>
                        </ul>
                        <br />
                        <!-- Web Counter Code START -->
                        <a href="index.aspx" target="_blank">
                            <img src="http://hitwebcounter.com/counter/counter.php?page=6357105&style=0021&nbdigits=5&type=page&initCount=20000" title="www.nitaibalance.co.uk" alt="www.nitaibalance.co.uk" border="0">
                        </a>
                        <br />
                        <!-- Web Counter -->
                        <a href="index.aspx"
                            target="_blank" style="font-family: Geneva, Arial, Helvetica; font-size: 9px; color: #76766B; text-decoration: none;"><strong>NITAI LIMITED</strong>
                        </a>
                    </div>
                    <div class="span3">
                        <h5>Others</h5>
                        <ul>
                            <li type="none">Home</li>
                            <li type="none">FAQs</li>
                            <li type="none">Terms and Conditions</li>
                            <li type="none">Privacy Policy</li>
                            <li type="none">Sitemap</li>
                            <li type="none">Copyright</li>
                        </ul>
                        <br />
                        <h5>Find us on</h5>
                        <div style="font-size: 2.5em;">
                            <a href="https://www.youtube.com/channel/UCj5cH1YVW_dNIqFyXd44zHw" role="button" data-toggle="modal" style="display: inline-block; width: 1em"><i class="icon-facetime-video"></i></a>
                            <a href="https://plus.google.com/u/0/b/105006501226826351012/?pageId=105006501226826351012" title="" style="display: inline-block; width: 1em"><i class="icon-google-plus-sign"></i></a>
                        </div>
                    </div>

                    <div class="span3">
                        <h4>Contact us</h4>
                        <address style="margin-bottom: 15px;">
                            <strong><a title="Nitai Ltd."><i class=" icon-home"></i>Nitai Ltd.</a></strong>
                            <br>
                            Ectoville Estet, Road A,<br />
                            Off. Enterprise Road,
                            <br />
                            Industrial Area,<br />
                            Nairobi, Kenya,<br />
                            Post Box : 279-00623.<br />
                        </address>
                        Phone : <i class="icon-phone-sign"></i>&nbsp;  +254 733317193
                        <br>
                        Email : <a href="mailto:rs@nitaibalance.co.uk" title="Email"><i class="icon-envelope-alt"></i>rs@nitaibalance.co.uk</a><br />
                        CRM Link : <a href="http://nitailtd.com/CRM/FrmComplaint.aspx" title="Nitai Ltd."><i class="icon-globe"></i>www.nitailtd.com</a><br />
                        <br />
                    </div>
                </div>
                <center>
                <p style="padding: 18px 0 44px">
                    &copy; 2016, All rights reserved by <a class="link" href="https://www.nitaibalance.co.uk">Nitai Limited. </a>
                    <br />
                    <%--Designed By <a class="link" href="https://www.popularinfosys.com">Popular Infosys.</a>--%>
                </p>
                </center>
            </footer>
        </div>
        <!-- /container -->
    </section>
    <a href="#" class="btn" style="position: fixed; bottom: 40px; right: 10px; display: none;" id="toTop"><i class="icon-caret-up"></i></a>
    <!-- Javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script type="text/javascript" src="http://platform.twitter.com/widgets.js"></script>
    <script src="themes/js/jquery-1.8.3.min.js"></script>
    <script src="themes/js/bootstrap.min.js"></script>
    <script src="themes/js/bootstrap-tooltip.js"></script>
    <script src="themes/js/bootstrap-popover.js"></script>
    <script src="themes/js/business_ltd_1.0.js"></script>
    <script lang="javascript">
        document.onmousedown=disableclick;
        status="Right Click Disabled";
        Function disableclick(e)
        {
            if(event.button==2)
            {
                alert(status);
                return false;	
            }
        }
    </script>
    <script>
        document.onkeydown = function(e) {
            if (e.ctrlKey && 
                (e.keyCode === 85 )) {
                return false;
            }
        };
    </script>
</body>
</html>

