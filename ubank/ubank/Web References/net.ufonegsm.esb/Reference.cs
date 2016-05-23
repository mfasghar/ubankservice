﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.18444
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

// 
// This source code was auto-generated by Microsoft.VSDesigner, Version 4.0.30319.18444.
// 
#pragma warning disable 1591

namespace ubank.net.ufonegsm.esb {
    using System;
    using System.Web.Services;
    using System.Diagnostics;
    using System.Web.Services.Protocols;
    using System.Xml.Serialization;
    using System.ComponentModel;
    
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.0.30319.18408")]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Web.Services.WebServiceBindingAttribute(Name="SMS_SENDSOAP", Namespace="http://www.example.org/SMS_SEND/")]
    public partial class SMS_SEND : System.Web.Services.Protocols.SoapHttpClientProtocol {
        
        private System.Threading.SendOrPostCallback SendSmsOperationCompleted;
        
        private bool useDefaultCredentialsSetExplicitly;
        
        /// <remarks/>
        public SMS_SEND() {
            this.Url = global::ubank.Properties.Settings.Default.ubank_net_ufonegsm_esb_SMS_SEND;
            if ((this.IsLocalFileSystemWebService(this.Url) == true)) {
                this.UseDefaultCredentials = true;
                this.useDefaultCredentialsSetExplicitly = false;
            }
            else {
                this.useDefaultCredentialsSetExplicitly = true;
            }
        }
        
        public new string Url {
            get {
                return base.Url;
            }
            set {
                if ((((this.IsLocalFileSystemWebService(base.Url) == true) 
                            && (this.useDefaultCredentialsSetExplicitly == false)) 
                            && (this.IsLocalFileSystemWebService(value) == false))) {
                    base.UseDefaultCredentials = false;
                }
                base.Url = value;
            }
        }
        
        public new bool UseDefaultCredentials {
            get {
                return base.UseDefaultCredentials;
            }
            set {
                base.UseDefaultCredentials = value;
                this.useDefaultCredentialsSetExplicitly = true;
            }
        }
        
        /// <remarks/>
        public event SendSmsCompletedEventHandler SendSmsCompleted;
        
        /// <remarks/>
        [System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://www.example.org/SMS_SEND/SendSms", RequestNamespace="http://www.example.org/SMS_SEND/", ResponseNamespace="http://www.example.org/SMS_SEND/", Use=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)]
        [return: System.Xml.Serialization.XmlElementAttribute("ResultCode", Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string SendSms([System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)] string From_String, [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)] string To_MSISDN, [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)] string SMS_TEXT, [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)] string UserName, [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)] string Password, [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)] out string ResultDesc) {
            object[] results = this.Invoke("SendSms", new object[] {
                        From_String,
                        To_MSISDN,
                        SMS_TEXT,
                        UserName,
                        Password});
            ResultDesc = ((string)(results[1]));
            return ((string)(results[0]));
        }
        
        /// <remarks/>
        public void SendSmsAsync(string From_String, string To_MSISDN, string SMS_TEXT, string UserName, string Password) {
            this.SendSmsAsync(From_String, To_MSISDN, SMS_TEXT, UserName, Password, null);
        }
        
        /// <remarks/>
        public void SendSmsAsync(string From_String, string To_MSISDN, string SMS_TEXT, string UserName, string Password, object userState) {
            if ((this.SendSmsOperationCompleted == null)) {
                this.SendSmsOperationCompleted = new System.Threading.SendOrPostCallback(this.OnSendSmsOperationCompleted);
            }
            this.InvokeAsync("SendSms", new object[] {
                        From_String,
                        To_MSISDN,
                        SMS_TEXT,
                        UserName,
                        Password}, this.SendSmsOperationCompleted, userState);
        }
        
        private void OnSendSmsOperationCompleted(object arg) {
            if ((this.SendSmsCompleted != null)) {
                System.Web.Services.Protocols.InvokeCompletedEventArgs invokeArgs = ((System.Web.Services.Protocols.InvokeCompletedEventArgs)(arg));
                this.SendSmsCompleted(this, new SendSmsCompletedEventArgs(invokeArgs.Results, invokeArgs.Error, invokeArgs.Cancelled, invokeArgs.UserState));
            }
        }
        
        /// <remarks/>
        public new void CancelAsync(object userState) {
            base.CancelAsync(userState);
        }
        
        private bool IsLocalFileSystemWebService(string url) {
            if (((url == null) 
                        || (url == string.Empty))) {
                return false;
            }
            System.Uri wsUri = new System.Uri(url);
            if (((wsUri.Port >= 1024) 
                        && (string.Compare(wsUri.Host, "localHost", System.StringComparison.OrdinalIgnoreCase) == 0))) {
                return true;
            }
            return false;
        }
    }
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.0.30319.18408")]
    public delegate void SendSmsCompletedEventHandler(object sender, SendSmsCompletedEventArgs e);
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.0.30319.18408")]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    public partial class SendSmsCompletedEventArgs : System.ComponentModel.AsyncCompletedEventArgs {
        
        private object[] results;
        
        internal SendSmsCompletedEventArgs(object[] results, System.Exception exception, bool cancelled, object userState) : 
                base(exception, cancelled, userState) {
            this.results = results;
        }
        
        /// <remarks/>
        public string Result {
            get {
                this.RaiseExceptionIfNecessary();
                return ((string)(this.results[0]));
            }
        }
        
        /// <remarks/>
        public string ResultDesc {
            get {
                this.RaiseExceptionIfNecessary();
                return ((string)(this.results[1]));
            }
        }
    }
}

#pragma warning restore 1591