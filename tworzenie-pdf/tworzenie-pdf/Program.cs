using PuppeteerSharp;
using System.IO;
using System.Threading.Tasks;

class Program
{
    static async Task Main(string[] args)
    {
        await new BrowserFetcher().DownloadAsync(BrowserFetcher.DefaultChromiumRevision);

        var launchOptions = new LaunchOptions
        {
            Headless = true
        };

        using var browser = await Puppeteer.LaunchAsync(launchOptions);
        using var page = await browser.NewPageAsync();

        string htmlContent = "<html><body><h1>Hello, PDF!</h1></body></html>";
        await page.SetContentAsync(htmlContent);

        var pdfBytes = await page.PdfDataAsync();

        // Save the PDF bytes to a file
        string pdfFilePath = "output.pdf";
        File.WriteAllBytes(pdfFilePath, pdfBytes);

        Console.WriteLine("PDF file generated at: " + pdfFilePath);
    }
}