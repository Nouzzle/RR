namespace RateReel.Models
{
    public enum SlideType
    {
        Intro,
        Invitation,
        Login
    }

    public class SlideModel
    {
        public SlideType Type { get; set; }
        public string? Message { get; set; }
        public string ImageSource { get; set; } 
    }
}