﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.18408
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace devicecontrol.WebService {
    using System.Data;
    
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ServiceModel.ServiceContractAttribute(ConfigurationName="WebService.wsSoap")]
    public interface wsSoap {
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/HelloWorld", ReplyAction="*")]
        [System.ServiceModel.XmlSerializerFormatAttribute(SupportFaults=true)]
        string HelloWorld();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/GET_DATA_SET", ReplyAction="*")]
        [System.ServiceModel.XmlSerializerFormatAttribute(SupportFaults=true)]
        System.Data.DataSet GET_DATA_SET(string sql, string keyx);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/ExecuteSQL", ReplyAction="*")]
        [System.ServiceModel.XmlSerializerFormatAttribute(SupportFaults=true)]
        void ExecuteSQL(string sql, string keyx);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/SendMailToGood", ReplyAction="*")]
        [System.ServiceModel.XmlSerializerFormatAttribute(SupportFaults=true)]
        string SendMailToGood(string emailTo, string Content, string subject);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/GiveMeADataSet", ReplyAction="*")]
        [System.ServiceModel.XmlSerializerFormatAttribute(SupportFaults=true)]
        System.Data.DataSet GiveMeADataSet();
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public interface wsSoapChannel : devicecontrol.WebService.wsSoap, System.ServiceModel.IClientChannel {
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public partial class wsSoapClient : System.ServiceModel.ClientBase<devicecontrol.WebService.wsSoap>, devicecontrol.WebService.wsSoap {
        
        public wsSoapClient() {
        }
        
        public wsSoapClient(string endpointConfigurationName) : 
                base(endpointConfigurationName) {
        }
        
        public wsSoapClient(string endpointConfigurationName, string remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public wsSoapClient(string endpointConfigurationName, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public wsSoapClient(System.ServiceModel.Channels.Binding binding, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(binding, remoteAddress) {
        }
        
        public string HelloWorld() {
            return base.Channel.HelloWorld();
        }
        
        public System.Data.DataSet GET_DATA_SET(string sql, string keyx) {
            return base.Channel.GET_DATA_SET(sql, keyx);
        }
        
        public void ExecuteSQL(string sql, string keyx) {
            base.Channel.ExecuteSQL(sql, keyx);
        }
        
        public string SendMailToGood(string emailTo, string Content, string subject) {
            return base.Channel.SendMailToGood(emailTo, Content, subject);
        }
        
        public System.Data.DataSet GiveMeADataSet() {
            return base.Channel.GiveMeADataSet();
        }
    }
}