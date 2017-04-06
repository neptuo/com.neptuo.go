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
        public static string CssClassIfDeprecated(this LinkModel model)
        {
            Ensure.NotNull(model, "model");
            if (model.IsDeprecated)
                return "deprecated";

            return null;
        }
    }
}