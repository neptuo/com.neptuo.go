using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Xml.Serialization;

namespace Neptuo.Models
{
    [XmlType("Link")]
    public class LinkModel : IComparable<LinkModel>
    {
        [XmlAttribute]
        public string Title { get; set; }

        [XmlAttribute]
        public string Description { get; set; }

        [XmlAttribute]
        public string Url { get; set; }

        [XmlAttribute]
        public bool IsDeprecated { get; set; }

        public int CompareTo(LinkModel other)
        {
            int order = Title.CompareTo(other.Title);
            if (order != 0)
                return order;

            order = Url.CompareTo(other.Url);
            if (order != 0)
                return order;

            order = Description.CompareTo(other.Description);
            if (order != 0)
                return order;

            return 0;
        }
    }
}