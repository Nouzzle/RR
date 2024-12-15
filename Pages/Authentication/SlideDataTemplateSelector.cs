using Microsoft.Maui.Controls;
using RateReel.Models;

namespace RateReel.Selectors
{
    public class SlideDataTemplateSelector : DataTemplateSelector
    {
        public DataTemplate? IntroTemplate { get; set; }
        public DataTemplate? InvitationTemplate { get; set; }
        public DataTemplate? LoginTemplate { get; set; }

        protected override DataTemplate OnSelectTemplate(object item, BindableObject container)
        {
            if (item is SlideModel slide)
            {
                return slide.Type switch
                {
                    SlideType.Intro => IntroTemplate ?? throw new InvalidOperationException("IntroTemplate is not set."),
                    SlideType.Invitation => InvitationTemplate ?? throw new InvalidOperationException("InvitationTemplate is not set."),
                    SlideType.Login => LoginTemplate ?? throw new InvalidOperationException("LoginTemplate is not set."),
                    _ => IntroTemplate ?? throw new InvalidOperationException("IntroTemplate is not set.")
                };
            }
            throw new InvalidOperationException("Item is not of type SlideModel.");
        }
    }
}