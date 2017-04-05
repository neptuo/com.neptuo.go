using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Neptuo
{
    public static class _StringExtensions
    {
        public const string ProtocolSeparator = "://";

        public static string ToUrlWithoutProtocol(this string url)
        {
            if (String.IsNullOrEmpty(url))
                return url;

            int protocolIndex = url.IndexOf(ProtocolSeparator);
            if (protocolIndex < 0)
                return url;

            url = url.Substring(protocolIndex + ProtocolSeparator.Length);
            return url;
        }
    }
}