<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Frm_User_Master.aspx.cs" Inherits="Frm_User_Master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" runat="server" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8">
    <title>Nitai Ltd :: Petty Cash User Master</title>
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
    <script language="javascript" type="text/javascript">
        //this script will get the date selected from the given calendarextender (ie: "sender") and append the
        //current time to it.
        function AppendTime(sender, args) {
            var selectedDate = new Date();
            selectedDate = sender.get_selectedDate();
            var now = new Date();
            sender.get_element().value = selectedDate.format("dd/MM/yyyy") + " " + now.format("HH:mm:ss");
        }
    </script>
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
                            <%--<li id="Menu_Nitai_Statement" runat="server" class=""><a href="Nitai_Statement.aspx" target="_blank" title="Nitai Statement" style="font-style:normal">Nitai Statement</a></li>
							<li id="Menu_Admin_Reporting" runat="server" class=""><a href="Admin_Reporting.aspx" title="Admin Reporting" style="font-style: normal">Admin Reporting</a></li>
							<li id="Menu_Period" runat="server" class=""><a href="Close_Month.aspx" title="Period" style="font-style: normal">Period</a></li>--%>
                            <li id="Menu_Logout" runat="server" class=""><a href="index.aspx" title="Log out" style="font-style: normal">Log out</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!--Header Ends================================================ -->
    <!-- Page banner -->
    <section id="bannerSection" style="background-color: black">
        <div class="container">
            <h1 id="pageTitle">
                <img src="images/logo/Nitai_White.png" draggable="false" width="100px" title="Nitai Ltd." />
                Petty Cash (<%= Session["Uname"] %>)<br />
                <asp:Label runat="server" ForeColor="GreenYellow" Font-Size="X-Large">User Master</asp:Label>
            </h1>
        </div>
    </section>
    <!-- Page banner end -->
    <form id="form1" runat="server">
        <section id="bodySection">
            <div class="container">
                <div class="row">
                </div>
                <asp:ScriptManager ID="ScriptManager2" runat="server">
                </asp:ScriptManager>
                <div class="span4">
                    <div class="thumbnail">
                        <ul class="media-list">
                            <div id="div1" class="col-md-1 col-sm-1" runat="server">
                                <div class="row">
                                    <div id="Div2" class="span4 wow fadeInRight input-field" runat="server">
                                        <div class="thumbnail" style="background-color: darkcyan">
                                            <h3 style="color: Red">User Master</h3>
                                            <div class="control-group">
                                                <div class="controls">
                                                    <table>
                                                        <tr></tr>
                                                        <tr>
                                                            <td style="color: White"><b>User ID :</b></td>
                                                            <td>
                                                                <asp:TextBox ID="txtUser_ID" Font-Bold="true" CssClass="span3" runat="server" Enabled="false"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="color: White"><b>Username :</b></td>
                                                            <td>
                                                                <asp:TextBox ID="txtUsername" Font-Bold="true" CssClass="span3" runat="server" ToolTip="Type username here..."></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="color: White"><b>Password :</b></td>
                                                            <td>
                                                                <asp:TextBox ID="txtpassword" Font-Bold="true" CssClass="span3" runat="server" ToolTip="Type password here..."></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="color: White"><b>Usertype :</b></td>
                                                            <td>
                                                                <asp:DropDownList ID="cmbUsertype" Font-Bold="true" CssClass="span3" runat="server" ToolTip="Select Usertype here...">
                                                                    <asp:ListItem Selected="True" Value="0">Admin</asp:ListItem>
                                                                    <asp:ListItem Value="1">Super Visor</asp:ListItem>
                                                                    <asp:ListItem Value="2">Employee</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="color: White"><b>Branch Code :</b></td>
                                                            <td>
                                                                <asp:TextBox ID="txtbranchcode" Font-Bold="true" CssClass="span3" runat="server" ToolTip="Type Enter  here..."></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                        <tr>
                                                            <td style="color: White"><b>
                                                                <asp:Label ID="Label1" runat="server">Is Blacklist :</asp:Label></b>
                                                            </td>
                                                            <td>
                                                                <asp:CheckBox ID="chkIs_Blacklist" EnableTheming="true" Width="100px" Font-Bold="true" CssClass="checkbox" Text="Is Black Listed" ForeColor="White" runat="server" ToolTip="Employee is black listed"></asp:CheckBox>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <asp:Button ID="btnAdd" CssClass="btn btn-success" runat="server" Text="ADD" ToolTip="Add New User" OnClick="btnAdd_Click" />
                                                    <asp:Button ID="btn_Save" CssClass="btn btn-success" runat="server" Text="SAVE" ToolTip="Save" OnClick="btn_Save_Click" />
                                                    <asp:Button ID="btn_Delete" CssClass="btn btn-danger" runat="server" Text="DELETE" ToolTip="Delete Selected User" OnClick="btn_Delete_Click" />
                                                    <asp:Button ID="btn_Cancel" CssClass="btn btn-success" runat="server" Text="Cancel" ToolTip="Cancel" OnClick="btn_Cancel_Click" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                        </ul>
                    </div>
                </div>
                <div class="span4">
                    <ul class="media-list">
                        <div id="div3" class="col-md-1 col-sm-1" runat="server">
                            <div class="row">
                                <div id="Table" class="span5 wow fadeInRight input-field" runat="server">
                                    <div class="control-group">
                                        <div class="controls">
                                            <asp:GridView ID="gridCustomer" runat="server" CellPadding="3"
                                                CellSpacing="3" DataKeyNames="User_id" CssClass="responsive table table-condensed" AllowPaging="true"
                                                PageSize="10" AutoGenerateColumns="false" Font-Size="Small" HeaderStyle-Font-Bold="true" RowStyle-Font-Bold="true"
                                                HeaderStyle-BorderColor="black" HeaderStyle-HorizontalAlign="Right"
                                                HeaderStyle-ForeColor="black" HeaderStyle-BackColor="#9cfea1" RowStyle-ForeColor="GrayText"
                                                OnPageIndexChanging="gridCustomer_PageIndexChanging" OnRowCommand="gridCustomer_RowCommand">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Edit">
                                                        <ItemTemplate>
                                                            <center>
                                                                <asp:ImageButton ID="ImageButton2" runat="server" ControlStyle Width="15" CommandName="Edt" 
                                                                    ImageUrl="~/images/edit.png" CommandArgument='<%# Eval("User_id") %>' >
                                                                </asp:ImageButton>
                                                            </center>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="User_id" HeaderText="Code" InsertVisible="False" ReadOnly="True" SortExpression="User_id"></asp:BoundField>
                                                    <asp:BoundField DataField="Uname" HeaderText="Name" InsertVisible="False" ReadOnly="True" SortExpression="Uname"></asp:BoundField>
                                                    <asp:BoundField DataField="UserType" HeaderText="UserType" InsertVisible="False" ReadOnly="True" SortExpression="UserType"></asp:BoundField>
                                                    <asp:BoundField DataField="IsBlack_List" HeaderText="IsBlack_List" InsertVisible="False" ReadOnly="True" SortExpression="IsBlack_List"></asp:BoundField>
                                                   <asp:BoundField DataField="Branchcode" HeaderText="BranchCode" InsertVisible="False" ReadOnly="True" SortExpression="Branchcode"></asp:BoundField>
                                                </Columns>

                                            </asp:GridView>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ul>
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
        document.onmousedown = disableclick;
        status = "Right Click Disabled";
        Function disableclick(e)
        {
            if (event.button == 2) {
                alert(status);
                return false;
            }
        }
    </script>
    <script>
        document.onkeydown = function (e) {
            if (e.ctrlKey &&
				(e.keyCode === 85)) {
                return false;
            }
        };
    </script>
</body>
</html>
