using Microsoft.Maui.Controls;

namespace RateReel.Selectors
{
    public class PageTemplateSelector : DataTemplateSelector
    {
        public DataTemplate HomepageTemplate { get; set; }
        public DataTemplate TimelineTemplate { get; set; }
        public DataTemplate FilmsTemplate { get; set; }

        protected override DataTemplate OnSelectTemplate(object item, BindableObject container)
        {
            var pageType = item as string;
            return pageType switch
            {
                "Homepage" => HomepageTemplate,
                "Timeline" => TimelineTemplate,
                "Films" => FilmsTemplate,
                _ => null,
            };
        }
    }
}