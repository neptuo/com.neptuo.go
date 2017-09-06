using Neptuo;
using Neptuo.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Neptuo
{
    public static class _LinkModelExtensions
    {
        public static string CssClassIfReplacedById(this LinkModel model)
        {
            Ensure.NotNull(model, "model");
            if (model.ReplacedById != null)
                return "deprecated";

            return null;
        }
    }
}