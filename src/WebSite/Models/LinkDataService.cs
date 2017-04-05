using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Xml.Serialization;

namespace Neptuo.Models
{
    public class LinkDataService
    {
        public const string DataUri = "~/App_Data/Links.xml";

        private LinkCollection models;

        public LinkDataService(string dataUri)
        {
            using (StreamReader reader = new StreamReader(dataUri))
            {
                XmlSerializer serializer = new XmlSerializer(typeof(LinkCollection));
                models = (LinkCollection)serializer.Deserialize(reader);
            }
        }

        public LinkCollection Get()
        {
            return models;
        }
    }
}