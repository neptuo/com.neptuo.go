using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Xml.Serialization;

namespace Neptuo.Models
{
    [XmlType("Category")]
    [XmlRoot("Category")]
    public class LinkCategoryModel : IComparable<LinkCategoryModel>
    {
        [XmlAttribute]
        public string Name { get; set; }

        [XmlElement("Link")]
        public List<LinkModel> Links { get; set; }

        public int CompareTo(LinkCategoryModel other)
        {
            int order = Name.CompareTo(other.Name);
            return order;
        }
    }
}