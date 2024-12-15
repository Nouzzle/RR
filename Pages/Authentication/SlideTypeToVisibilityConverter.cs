using System;
using System.Globalization;
using Microsoft.Maui.Controls;
using RateReel.Models; 

namespace RateReel.Converters
{
    public class SlideTypeToVisibilityConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            if (value is SlideType slideType && parameter is string targetTypeString)
            {
                return slideType.ToString() == targetTypeString;
            }
            return false;
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            throw new NotImplementedException();
        }
    }
}