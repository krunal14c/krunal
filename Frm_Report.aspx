<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Frm_Report.aspx.cs" Inherits="Frm_Report" %>
<%--<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>--%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Nitai Ltd :: <%= Session["Uname"] %> Petty Cash Report </title>
    <meta name="keywords" content="Weighbridge in Kenya, Nairobi, Weighbridge Software, Unmanned Weighbridge Software, Weighing Scale Kenya, Weighbridge Kenya, Weighbridge Uganda, Weighbridge Tanzania, Weighbridge Burundi, Weighbridge Rwanda, Weighbridge South sudan, Weighbridge Ethopia, Weighbridge Congo, RFID Weighbridge Software, Weighbridge Software With CCTV and Auto Email, Time Attendance, Online Payroll, Desktop Payroll, Payroll, Tally.ERP 9, Tally Kenya, Online Weighbridge Software, Online Weighbride Reporting,Online Weighbridge, E-Reporting, Website Development, Android Application Development, Digital Load Cell, Digital Indicator">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Weighbridge, Weighbridge in Kenya, Nairobi, Weighbridge Software, Unmanned Weighbridge Software, Weighing Scale Kenya, Weighbridge Kenya, Weighbridge Uganda, Weighbridge Tanzania, Weighbridge Burundi, Weighbridge Rwanda, Weighbridge South sudan, Weighbridge Ethopia, Weighbridge Congo, RFID Weighbridge Software, Weighbridge Software With CCTV and Auto Email, Time Attendance, Online Payroll, Desktop Payroll, Payroll, Tally.ERP 9, Tally Kenya, Online Weighbridge Software, Online Weighbride Reporting,Online Weighbridge, E-Reporting, Website Development, Android Application Development, Digital Load Cell, Digital Indicator">
    <meta name="classification" content="Website Development, Android Application Development, Weighbridge Automation,  IT - automation company">
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

    <script type="text/javascript">
        function preventBack() { window.history.forward(); }
        setTimeout("preventBack()", 0);
        window.onunload = function () { null };
    </script>

</head>
<body runat="server">
    <!--Header Ends================================================ -->
    <form id="frm" runat="server">
        <center>
       <asp:Label ID="Label1" runat="server" Font-Bold="true" Font-Names="Arial" ForeColor="Maroon" Font-Size="Medium">Petty Cash Report : <%= Session["Uname"] %>,</asp:Label> &nbsp;
       <asp:Label ID="lblBalance" runat="server" Font-Bold="true" Font-Names="Arial" ForeColor="Blue" Font-Size="Medium"></asp:Label> &nbsp; 
       <asp:Label ID="lblMonth_Year" runat="server" Font-Bold="true" Font-Names="Arial" ForeColor="Red" Font-Size="Medium"><%= Session["Current_Month_Name"] %>, <%= Session["Current_Year_Id"]%></asp:Label>
      <asp:GridView ID="gridCustomer" runat="server" CellPadding="2"
        CellSpacing="2" DataKeyNames="In" CssClass="responsive table table-condensed" AllowPaging="false"
        AutoGenerateColumns="true" Font-Size="Smaller" Font-Names="Calibri" HeaderStyle-Font-Bold="true" RowStyle-Font-Bold="false"
        HeaderStyle-BorderColor="black" HeaderStyle-HorizontalAlign="Center" ShowFooter="true"  
        HeaderStyle-ForeColor="black" HeaderStyle-BackColor="#9cfea1" RowStyle-ForeColor="black">          
          <Columns>
              <asp:TemplateField HeaderText="Sign" ItemStyle-Width="50"></asp:TemplateField>
          </Columns>
      </asp:GridView>
  </center>
    </form>
</body>
</html>
