using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Xml.Serialization;

namespace Neptuo.Models
{
    [XmlRoot("Links", Namespace = "http://schemas.neptuo.com/xsd/neptuo-go-links.xsd")]
    public class LinkCollection : List<LinkModel>
    {
    }
}