using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Xml.Serialization;

namespace Neptuo.Models
{
    [XmlType("Link")]
    [XmlRoot("Link")]
    public class LinkModel
    {
        [XmlAttribute]
        public string Title { get; set; }

        [XmlAttribute]
        public string Description { get; set; }

        [XmlAttribute]
        public string Url { get; set; }

        [XmlAttribute]
        public bool IsDeprecated { get; set; }
    }
}