<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" runat="server" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Nitai Ltd :: Weighbridge, Weighbridge Software, Unmanned Weighbridge Software, Weighing Scale, Weighbridge Kenya, RFID Weighbridge Software, Weighbridge Software With CCTV and Auto Email." </title>
    <meta name="keywords" content="Weighbridge in Kenya, Nairobi, Weighbridge Software, Unmanned Weighbridge Software, Weighing Scale Kenya, Weighbridge Kenya, Weighbridge Uganda, Weighbridge Tanzania, Weighbridge Burundi, Weighbridge Rwanda, Weighbridge South sudan, Weighbridge Ethopia, Weighbridge Congo, RFID Weighbridge Software, Weighbridge Software With CCTV and Auto Email, Time Attendance, Online Payroll, Desktop Payroll, Payroll, Tally.ERP 9, Tally Kenya, Online Weighbridge Software, Online Weighbride Reporting,Online Weighbridge, E-Reporting, Website Development, Android Application Development, Digital Load Cell, Digital Indicator">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Weighbridge, Weighbridge in Kenya, Nairobi, Weighbridge Software, Unmanned Weighbridge Software, Weighing Scale Kenya, Weighbridge Kenya, Weighbridge Uganda, Weighbridge Tanzania, Weighbridge Burundi, Weighbridge Rwanda, Weighbridge South sudan, Weighbridge Ethopia, Weighbridge Congo, RFID Weighbridge Software, Weighbridge Software With CCTV and Auto Email, Time Attendance, Online Payroll, Desktop Payroll, Payroll, Tally.ERP 9, Tally Kenya, Online Weighbridge Software, Online Weighbride Reporting,Online Weighbridge, E-Reporting, Website Development, Android Application Development, Digital Load Cell, Digital Indicator">
    <meta name="google-site-verification" content="gNXpopsGwnQT3c2hfLfGdr5ySRBBIhO_oLe1sO3YYZw" />
    <meta name="author" content="Rajesh Solanki">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7">

    <link href="favicon.ico" rel="shortcut icon" type="image/x-icon" style="width: auto" />
    <link href="favicon.ico" rel="icon" type="image/x-icon" style="width: auto" />

    <link id="callCss" rel="stylesheet" href="themes/current/bootstrap.min.css" type="text/css" media="screen" />
    <link href="themes/css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css">
    <link href="themes/css/font-awesome.css" rel="stylesheet" type="text/css">
    <link href="themes/css/base.css" rel="stylesheet" type="text/css">
    <style type="text/css" id="enject"></style>
    <%--<script type="text/javascript">
        function preventBack() { window.history.forward(); }
        setTimeout("preventBack()", 0);
        window.onunload = function () { null };
    </script>--%>
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
                    <img class="span2" src="images/logo/Main Logo.png" draggable="false" width="150px" style="margin-top: -20px" title="Nitai Ltd." />
                    <div class="row-fluid">
                    <div class="span3">
                        <form id="form2" runat="server">
                            <%--<audio src="Music/harekrishn_Q0p07hee.mp3" autoplay="autoplay" loop="loop" runat="server" aria-haspopup="true"></audio>--%>
                            <asp:TextBox ID ="txtUsername" runat="server" CssClass="input-medium" placeholder="Username" ToolTip="Enter your username here...." />
                            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="input-medium" placeholder="Password" ToolTip="Enter your password here...." />
                            <asp:DropDownList ID="cmbYear" runat="server" CssClass="dropdown" ToolTip="Select Period"></asp:DropDownList>
                            <asp:Button ID="btnSignin" runat="server" CssClass="btn btn-success" Text="Log In" OnClick="btnSignin_Click" ToolTip="Login"/>
                            <asp:Button ID="btnCancel" runat="server" CssClass="btn btn-primary" Text="Cancel" OnClick="btnCancel_Click" ToolTip="Cancel"/>
                            <asp:Label ID="lbl" runat ="server" CssClass="label-warning"></asp:Label>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--Header Ends================================================ -->
    <section id="carouselSection" style="text-align: center">
        <div id="myCarousel" class="carousel slide">
            <div class="carousel-inner">
                <div style="text-align: center" class="item active">
                    <div class="wrapper">
                        <img src="themes/images/carousel/1.png" draggable="false" alt="Weghing Scale">
                    </div>
                </div>
                <div style="text-align: center" class="item">
                    <div class="wrapper">
                        <img src="themes/images/carousel/2.png" draggable="false" alt="Unmanned Weighbridge Software">
                    </div>
                </div>
                <div style="text-align: center" class="item">
                    <div class="wrapper">
                        <img src="themes/images/carousel/3.png" draggable="false" alt="Tally ERP.9">
                    </div>
                </div>
                <div style="text-align: center" class="item">
                    <div class="wrapper">
                        <img src="themes/images/carousel/4.png" draggable="false" alt="Time Attendance and Payroll">
                    </div>
                </div>
            </div>
            <a class="left carousel-control" href="#myCarousel" data-slide="prev" draggable="false">&lsaquo;</a>
            <a class="right carousel-control" href="#myCarousel" data-slide="next" draggable="false">&rsaquo;</a>
        </div>
    </section>
    <!-- Sectionone ends ======================================== -->
    <section id="middleSection">
        <div class="container ">
            <div class="row" style="text-align: center">
                <div class="span12">
                    <div class="well well-small">
                        <h4>What We Provide?</h4>
                        <p class="nav-header">
                            " We are glad to introduce ourselves as the provider of complete weighing solution to wide range of weighing applications confronted by customer spread out in different fields like Fundamental Research. Education, Industries."<br />
                            <br />
                        </p>
                    </div>
                </div>
                <div class="span2">
                    <div class="well well-small">
                        <h4>
                            <a href="#" class="popOver" data-placement="top" data-content=" <ul> <li> Lab Scale </li> <li> Jewellary Scale </li> <li> Table Top </li> <li> Plateform Scale </li> <li> Crane Scale / Hanging Scale </li> <li> Weighbridge </li></ul>" data-original-title="Weighing Scale Categories" style="display: block; text-decoration: none; text-align: center">
                                <i style="width: auto; font-size: 2em; line-height: 1em; height: auto" class="icon-truck"></i>
                                <span>
                                    <br />
                                    Weighing Scale</span>
                            </a>
                        </h4>
                        <a href="http://www.nitaibalance.co.uk/WeighingScale.aspx"><small>view details</small></a>
                    </div>
                </div>
                <div class="span3">
                    <div class="well well-small">
                        <h4>
                            <a href="#" class="popOver" data-placement="top" data-content=" <ul> <li> Std WB Software </li> <li> CCTV Module </li> <li> Auto Email & SMS </li> <li> Unmanned WB Software </li> <li> Label Printing Software </li> <li> Weighing to Packaging Slip Software </li></ul>" data-original-title="Wighbridge Software" style="display: block; text-decoration: none">
                                <i style="width: auto; font-size: 2em; line-height: 1em; height: auto" class="icon-tint"></i>
                                <span>
                                    <br />
                                    Unmanned Weighbridge S/w</span>
                            </a>
                        </h4>
                        <a href="http://www.nitaibalance.co.uk/Weighbridge.aspx"><small>view details</small></a>
                    </div>
                </div>
                <div class="span3">
                    <div class="well well-small">
                        <h4>
                            <a href="#" class="popOver" data-placement="top" data-content=" <ul> <li> Handpunch </li> <li> Finger Print Reader </li> </ul>" data-original-title="Time Attendance Software" style="display: block; text-decoration: none">
                                <i style="width: auto; font-size: 2em; line-height: 1em; height: auto" class="icon-time"></i>
                                <span>
                                    <br />
                                    Time Attendence</span>
                            </a>
                        </h4>
                        <a href="http://www.nitaibalance.co.uk/TAandPayroll.aspx"><small>view details</small></a>
                    </div>
                </div>
                <div class="span2">
                    <div class="well well-small">
                        <h4>
                            <a href="#" class="popOver" data-placement="top" data-content=" <ul> <li> Online Payroll </li> <li> Desktop Payroll </li> <li> Kenyan Tax </li> </ul>" data-original-title="Payroll System" style="display: block; text-decoration: none">
                                <i style="width: auto; font-size: 2em; line-height: 1em; height: auto" class="icon-money"></i>
                                <span>
                                    <br />
                                    Payroll
                                </span>
                            </a>
                        </h4>
                        <a href="http://www.nitaibalance.co.uk/TAandPayroll.aspx"><small>view details</small></a>
                    </div>
                </div>
                <div class="span2">
                    <div class="well well-small">
                        <h4>
                            <a href="#" id="poverone" class="popOver" data-placement="top" data-content=" <ul> <li> Lab Scale </li> <li> Jewellary Scale </li> <li> Table Top </li> <li> Plateform Scale </li> <li> Crane Scale / Hanging Scale </li> <li> Weighbridge </li>" data-original-title="Tally ERP Software" style="display: block; text-decoration: none">
                                <i style="width: auto; font-size: 2em; line-height: 1em; height: auto" class="icon-group"></i>
                                <span>
                                    <br />
                                    Tally</span>
                            </a>
                        </h4>
                        <a href="http://www.nitaibalance.co.uk/Tally.aspx"><small>view details</small></a>
                    </div>
                </div>
                <div class="span4">
                    <div class="well well-small">
                        <h4>
                            <a href="#" id="A1" class="popOver" data-placement="top" data-content=" <ul> <li> High Accuracy </li> <li> No Junction Box </li> <li> Water proof </li> <li> Lightening Protection </li> <li> Easy Installation </li> <li> Compatible for all digital indicator </li>" data-original-title="Digital Load Cell" style="display: block; text-decoration: none">
                                <i style="width: auto; font-size: 2em; line-height: 1em; height: auto" class="icon-cog"></i>
                                <span>
                                    <br />
                                    Digital Load Cell</span>
                            </a>
                        </h4>
                        <a href="http://www.nitaibalance.co.uk/DigitalLoadCell.aspx"><small>view details</small></a>
                    </div>
                </div>
                <div class="span4">
                    <div class="well well-small">
                        <h4>
                            <a href="#" id="A2" class="popOver" data-placement="top" data-content=" <ul> <li> 7 inch 800*480 TFT color display </li> <li> High precise touch operation </li> <li> Various Scale analytic interface </li> <li> Multi-level management for user </li> <li> Isolated load cell with all external connection </li> <li> Load cell has no influence </li>" data-original-title="Digital Indicator" style="display: block; text-decoration: none">
                                <i style="width: auto; font-size: 2em; line-height: 1em; height: auto" class="icon-dashboard"></i>
                                <span>
                                    <br />
                                    Digital Indicator</span>
                            </a>
                        </h4>
                        <a href="http://www.nitaibalance.co.uk/Digital_indicator.aspx"><small>view details</small></a>
                    </div>
                </div>
                <div class="span4">
                    <div class="well well-small">
                        <h4>
                            <a href="#" id="A3" class="popOver" data-placement="top" data-content=" <ul> <li> RFID Reader / RFID Card </li> <li> Traffic Light For Driver Indication </li> <li> Microprocessor based digital indicator </li> <li> Stainless steel hopper </li> <li> Load cell / Weighbridge </li> <li> Weight indicator </li>" data-original-title="Bulk Loading System" style="display: block; text-decoration: none">
                                <i style="width: auto; font-size: 2em; line-height: 1em; height: auto" class="icon-save"></i>
                                <span>
                                    <br />
                                    Bulk Loading System</span>
                            </a>
                        </h4>
                        <a href="http://www.nitaibalance.co.uk/BulkLoadingSystem.aspx"><small>view details</small></a>
                    </div>
                </div>
            </div>
    </section>
    <section id="bodySection">
        <div class="container ">
            <div class="row">
                <h3 class="span12" style="text-align: center">Our Services <small>Completed projects (200+)</small></h3>
            </div>
            <ul class="nav nav-tabs container" id="myTab">
                <li class="active"><a href="#one" data-toggle="tab">Weighing Scale</a></li>
                <li><a href="#two" data-toggle="tab">Unmanned Weighbridge Software</a></li>
                <li><a href="#three" data-toggle="tab">Time Attendance</a></li>
                <li><a href="#four" data-toggle="tab">Payroll</a></li>
                <li><a href="#five" data-toggle="tab">Digital Load Cell</a></li>
                <li><a href="#six" data-toggle="tab">Digital Indicator</a></li>
                <li><a href="#seven" data-toggle="tab">Tally.ERP 9</a></li>
                <li><a href="#eight" data-toggle="tab">Bulk Loading System</a></li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane active" id="one">
                    <div class="container">
                        <div class="row">
                            <div class="span5">
                                <h2>Weighing Scale</h2>
                                <img src="images/truck.JPG" draggable="false" width="400px" class="img-rounded" />
                            </div>
                            <div class="span7">
                                <p class="breadcrumb">
                                    Our weighbridges are available in two configurations - Pit Type & Pitless Type - and in a wide variety of platform sizes and capacities.Weighbridges suitable for heavy duty weighing of bulk carriers used for highway transportation as well as for heavier off-road hauling applications in construction operations, mining etc.Weighbridge Platform comes in Pit / Pitless composite type. It is Rust free & has Longer durability. No painting is required. It is completely maintenance free, more economical & trouble free as compared to steel weighbridge. It saves transport cost as it is constructed at the site.
                                    Moisture analyzer is a laboratory measuring instrument intended to determine relative humidity for small samples of different materials. MA.R series redefines moisture analyzers standards. This series has been equipped with brand new readable LCD display providing an extra text line for information such as supplementary messages and data, e.g. product name or tare value.
                                    The AS.R series represents a new standard level for analytical balances. It features modern, readable LCD display which allows a clearer presentation of the weighing result. The display has a new text information line presenting additional messages and data, e.g. product name or tare value. The balance precision and the measurement accuracy is assured by automatic internal adjustment, which analyses temperature changes and time flow.
                                    The high precision series balances feature the latest generation capacitive display providing the maximum comfort of use, available right at your fingertips. Ease of operation, clear menu and practical arrangement of the display guarantee the best ergonomics for your everyday tasks. A wide array of available interfaces facilitate selection of the most optimal means for communication.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane" id="two">
                    <div class="container">
                        <div class="row">
                            <div class="span5">
                                <h2>Unmanned Weighbridge Software</h2>
                                <img src="images/WB/WB2/1.png" draggable="false" width="400px" class="img-rounded" />
                            </div>
                            <div class="span7">
                                <p class="breadcrumb">
                                    The Unmanned Weighbridge System is a standalone system which allows 24 hours 7 days a week weighing operations without the need of operator. Due to the system's easy interface it is totally operated by the truck driver. Moreover Imagic Solution custom designs the system to suit the specific requirements of your operations..
                                    We Provide Easy to Use Windows Based Weighbridge Software, it will Provide Secure Weighment with Various Facility Like CCTV Image Capture Facility, RFID Integration, Barrier Gate Integration, etc... 
                                    We Customization Weighbridge Software as per customer Requirement so its sute his require. Weighbridge software is a weighing and computing system with extensive data extraction, collection and processing functions. This Weighbridge software solution is designed to help you to manage and track the critical information created at the time of weighing and label products in an easy and flexible manner.
                                    Reports are designed to give all kind of output as required. Reports can be made available for all the parameters to give users in-depth analysis of their business. weighing software also has an option for exporting of reports in different formats like Microsoft Excel, TEXT, CSV. Standard reports include.
                                    Our company provide Weighbridge software, Truck scale software, Weighbridge, weighment software, weighing scale software, crusher software, Mining software, Industrial weighment software, weighbridge automation software, Platform scale software, and provide connectivity & Interface with SAP, Oracle, ERP etc... 
                                    Automated Weighbridge System - Imagic Software is a intelligent solution that turns your weighbridge to a simple unattended terminal, eliminating the need of weighbridge operator. The system can be customized with many add-ons like camera plate recognition, surveillance cameras, traffic barriers, traffic lights, etc. This innovative weighing application developed by Imagic is suitable for the Waste Recycling plants , Biomass to Energy plants, Oil and Gas Stations, Cement Plants etc...
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane" id="three">
                    <div class="container">
                        <div class="row">
                            <div class="span5">
                                <h2>Time Attendance</h2>
                                <img src="images/taandpayroll/taandpayroll/3.jpg" draggable="false" width="500px" height="500px" class="img-rounded" />
                            </div>
                            <div class="span7">
                                <p class="breadcrumb">
                                    Our Time Master suite is a complete system including a choice of hardware clocking systems, and software that fits easily into your business structure and gives greater control over your workforce. You can choose from a wide range of hardware clocking devices such as the tamper proof hand punch machine, a finger print reader or a card based machine.
                                    You can choose from a wide range of hardware clocking devices such as the tamper proof hand punch machine, a finger print reader or a card based machine. Managing time, and paying on the same time is a complex task especially with a large number of employees. Time Master can help you achieve this with ease and minimal manual intervention.
                                    There are no cards to create, administer, carry - or lose. The HandPunch® 1000 verifies employees' identities in less than one second, based on the unique size and shape of their hands. For small companies, the HandPunch 1000 provides a quick return on investment by eliminating the cost associated with administrating and managing cards. For companies that have small, multiple locations, minimal supervision leaves opportunity for buddy punching and time fraud. With the HandPunch 1000 one employee can't punch for the other. Time fraud is eliminated thereby reducing payroll costs and increasing the company's bottom line.
                                    Fingerprints for matching purposes generally requires the comparison of several features of the print pattern. These include patterns, which are aggregate characteristics of ridges, and minutia points, which are unique features found within the patterns.[1] It is also necessary to know the structure and properties of human skin in order to successfully employ some of the imaging technologies.
                                    We have made a strong communication module that allows for our software to be fully integrated with hand punch machines, finger print readers and the proximity RFID card readers. Multiple technologies can work on the same software, providing the flexibility required by the end user.    
                                    A fully functional and easy to use shift management module that allows for assigning of shifts to employees with ample flexibility. Multiple shifts can be assigned on different days, weeks or for different months as and when required.
                                    Leave Management: A comprehensive module that allows the user to create an unlimited amount of leave days as per company policy, and assign to employees as and when required. An adjustment of absenteeism to leave days is also possible..

                                </p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane" id="four">
                    <div class="container">
                        <div class="row">
                            <div class="span5">
                                <h2>Online Payroll</h2>
                                <img src="images/taandpayroll/taandpayroll/1.png" draggable="false" width="400px" class="img-rounded" />
                                <h2>Offline Payroll</h2>
                                <img src="images/taandpayroll/taandpayroll/2.jpg" draggable="false" width="400px" class="img-rounded" />
                            </div>
                            <div class="span7">
                                <p class="breadcrumb">
                                    Online Payroll Software is a sophisticated and comprehensive software,Online Payroll Software is designed to suit the need of HR and Finance professionals across small, medium and large size organizations. Developed with the latest technology, Payroll Software is powerful and yet so easy to use that it makes payroll processing a simple job that can be performed in-house. Developed with the latest technology, Payroll Software is powerful and yet so easy to use that it makes payroll processing a simple job that can be performed in-house.
                                    Flexible and parameter-based set up for taxation of Employee Benefits to incorporate additions and changes to tax laws with an option to create additional benefits field for future.Provision for applying any special/additional tax as and when required for directors and employees working for more than one organization.Fully flexible rounding options.Option to revise payroll figures for salary revision through Performance appraisals.Net-to-Basic calculator in addition to the standard Basic-to-Net calculator useful for salary negotiations.
                                    Managing time, and paying on the same time is a complex task especially with a large number of employees. Time Master can help you achieve this with ease and minimal manual intervention. 
                                    Our Time Master suite is a complete system including a choice of hardware clocking systems, and software that fits easily into your business structure and gives greater control over your workforce. You can choose from a wide range of hardware clocking devices such as the tamper proof hand punch machine, a finger print reader or a card based machine. 
                                    Time Master is designed and developed to cater for all sizes and types of organizations from the small to medium to the large sized and its unique scalable and parameterized system makes it versatile to suit the needs of organizations across industries and sectors. Time Master has been installed and is successfully running in more than 200 units in sub-Saharan Africa ranging from agro based farms to manufacturing units to hotels and lodges, steel plants, banks, and retail outlets. 
                                    We have made a strong communication module that allows for our software to be fully integrated with hand punch machines, finger print readers and the proximity RFID card readers. Multiple technologies can work on the same software, providing the flexibility required by the end user.
                                    A fully functional and easy to use shift management module that allows for assigning of shifts to employees with ample flexibility. Multiple shifts can be assigned on different days, weeks or for different months as and when required.Leave Management: A comprehensive module that allows the user to create an unlimited amount of leave days as per company policy, and assign to employees as and when required. An adjustment of absenteeism to leave days is also possible..
                                    For pre specified and authorized users, the system is flexible enough to permit manual adjustments to suit particular needs.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane" id="five">
                    <div class="container">
                        <div class="row">
                            <div class="span5">
                                <h2>Digital Load Cell</h2>
                                <img src="images/Di/loadcell.jpg" draggable="false" width="200px" class="img-rounded" />
                            </div>
                            <div class="span7">
                                <p class="breadcrumb" style="font-family: Candara; text-align: left">
                                    <b>Features :</b>
                                    <ul class="breadcrumb" style="text-align: left">
                                        <li>1. High Accuracy</li>
                                        <br />
                                        <li>2. No Junction Box installtion</li>
                                        <br />
                                        <li>3. Water proof and lightening protection</li>
                                        <br />
                                        <li>4. Upper and lower inhibitors design, Easy installtion</li>
                                        <br />
                                        <li>5. Radio frequency interference</li>
                                        <br />
                                        <li>6. Dynemic response and super capacity for anti-overload</li>
                                        <br />
                                        <li>7. High quality stainless steel construction</li>
                                        <br />
                                        <li>8. Hermetically sealed IP69K protection class</li>
                                        <br />
                                        <li>9. PVC anti rat cable protection, high temperature</li>
                                        <br />
                                        <li>10. Quick connection cable</li>
                                        <br />
                                        <li>11. Truck scale, Hopper scale and tank weighing application</li>
                                        <br />
                                        <li>12. Compatible for all digital indicator</li>
                                        <br />
                                    </ul>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane" id="six">
                    <div class="container">
                        <div class="row">
                            <div class="span5">
                                <h2>Digital Indicator</h2>
                                <img src="images/Di/digitalindicator1.png" draggable="false" width="400px" class="img-rounded" />
                            </div>
                            <div class="span7">
                                <p class="breadcrumb" style="text-align: left; font-family: Candara">
                                    <b>Main Features :</b>
                                    <ul class="breadcrumb" style="text-align: left">
                                        <li>1. 7 inch 800*480 TFT color display.</li>
                                        <br />
                                        <li>2. High precise touch operation and quick reaction speed, no need for external keyboard support.</li>
                                        <br />
                                        <li>3. Support Ethernet interface, RS232, RS232, RS485, Parallel printing interface and scoreboard interface.</li>
                                        <br />
                                        <li>4. Various interface for digital scale adjustment and make full use of the digital function for truck scale.</li>
                                        <br />
                                        <li>5. Abnormal Condition reminding with clear information and instruction for error solution.</li>
                                        <br />
                                        <li>6. Support English touch scoreboards   input and make words editing easier.</li>
                                        <br />
                                        <li>7. Various Scale analytic interface and make error solution easier.</li>
                                        <br />
                                        <li>8. Support column load cells with angle test (Optinal).</li>
                                        <br />
                                        <li>9. Multi-level management for user, maintenance people and manufacture.</li>
                                        <br />
                                        <li>10. Support routine C.E.K communication protocols.</li>
                                        <br />
                                        <li>11. Isolated load cell with all external connection device in electrical part and the load cell has no influence the external electric leakage, the load cell interface of indicator has strong anti- surge and static protection.</li>
                                        <br />
                                        <li>12. Type setting function for printing weighing note.</li>
                                        <br />
                                    </ul>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane" id="seven">
                    <div class="container">
                        <div class="row">
                            <div class="span5">
                                <h2>Tally.ERP 9</h2>
                                <img src="images/Tally/2.jpg" draggable="false" width="400px" class="img-rounded" />
                            </div>
                            <div class="span7">
                                <p class="breadcrumb">
                                    Since 2014, we are been appointed official Tally Partner,Tally is Accounting and Inventory Software.
                                    We not only Sales, implement, Train for Tally client, but also we Customize the Tally as per client requirement.
                                    Tally.ERP 9 has grown from a basic accounting software package into a simple-yet-sophisticated business management software product. Comprehensive capabilities allow Tally.ERP 9 to meet the needs of small to large businesses with dispersed operations. You bank and pay utility bills from home, why not do your business transactions? Or call up a stock status report and print a copy from wherever you are? Tally.ERP 9 has been designed with you in mind. Powerful connectivity makes information available with your staff, CA and other professionals, round-the-clock, in any place. It's also quick to install and allows incremental implementation-a novel capability that lets you activate just as many of its functions when required, even across locations.
                                    At Tally, we have a hard-earned reputation for empowering businesses with stable, effective software products. Tally.ERP 9 has all the features required for high-performance business management.
                                    With Trusted Remote Access, Audit & Compliance Services, an Integrated Support Centre and Security management, all focused on delivering peace of mind to You. It is a complete product that retains its original simplicity yet offers comprehensive business functionalities such as Accounting, Finance, Inventory, Sales, Purchase, Point of Sales, Manufacturing, Costing, Job Costing, Payroll and Branch Management along with capabilities like Statutory Processes, excise etc. Whatever the demands, Tally ERP 9 makes life a lot easier. With an ideal combination of function, control and customisability built in, Tally.ERP 9 permits business owners and their associates to do more.
                                    The product is supported on Windows operating system; on Windows XP and above.
                                    A growing economy, widening tax base and increasing compliance requirements are today's reality. As a result, Chartered Accountants are often pressed for time. Further, their travel costs escalate by the day and people are in short supply to handle the short periods of intense work during the year. You can turn all this around with the powerful audit tool designed exclusively for CA.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane" id="eight">
                    <div class="container">
                        <div class="row">
                            <div class="span5">
                                <h2>Bulk Loading System</h2>
                                <img src="images/bulkloading/Bulk-Loading-System.jpg" draggable="false" width="400px" class="img-rounded" />
                            </div>
                            <div class="span7">
                                <p class="breadcrumb" style="text-align: left; font-family: Candara">
                                    <b>Main Features :</b>
                                    <ul class="breadcrumb" style="text-align: left; font-family: Verdana; font-size:small" >
                                        <li>1. RFID Reader / RFID Card.</li>
                                        <br />
                                        <li>2. Traffic Light For Driver Indication.</li>
                                        <br />
                                        <li>3.  Microprocessor based digital indicator.</li>
                                        <br />
                                        <li>4. Stainless steel hopper.</li>
                                        <br />
                                        <li>5.  Load cell / Weighbridge.</li>
                                        <br />
                                        <li>6. Weight indicator.</li>
                                        <br />
                                        <li>7. Accurate weighing of continuous product flow.</li>
                                        <br />
                                        <li>8. Robust construction.</li>
                                        <br />
                                        <li>9. Low maintenance.</li>
                                        <br />
                                        <li>10. User-friendly interface.</li>
                                        <br />
                                        <li>11. Gentle product handling.</li>
                                        <br />
                                        <li>12. Labor-saving.</li>
                                        <br />
                                    </ul> 
                                </p>
                                <p class="breadcrumb" style="text-align: left; font-family: Verdana; font-size:small">
                                    Our firm supplies a wide array of Hopper Weighing System which is designed and developed for accurate and precise weighing of bin / hoppers. Owing to high quality raw material and technology used in its fabrication, our product is high in quality and lasts longer. Being compact in design and precision engineered, these controllers are extensively used in pharmaceutical and chemical. 
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- body block end======================================== -->
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
                            <%--<a href="#facebook" role="button" data-toggle="modal" style="display: inline-block; width: 1em"><i class="icon-facebook-sign"></i></a>--%>
                            <%--<a href="#twitter" role="button" data-toggle="modal" title="" style="display: inline-block; width: 1em"><i class="icon-twitter-sign"></i></a>--%>
                            <a href="https://www.youtube.com/channel/UCj5cH1YVW_dNIqFyXd44zHw" role="button" data-toggle="modal" style="display: inline-block; width: 1em"><i class="icon-facetime-video"></i></a>
                            <a href="https://plus.google.com/u/0/b/105006501226826351012/?pageId=105006501226826351012" title="" style="display: inline-block; width: 1em"><i class="icon-google-plus-sign"></i></a>
                            <%--<a href="#rss" role="button" data-toggle="modal" style="display: inline-block; width: 1em"><i class="icon-rss"></i></a>--%>
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
                    Designed By <a class="link" href="http://www.popularinfosys.com">Popular Infosys.</a>
                </p></center>
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
    <script language="javascript">
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
