import qrcode
from PIL import Image
import win32print
import sys

def generate_qr_code(url):
    qr = qrcode.QRCode(version=1, error_correction=qrcode.constants.ERROR_CORRECT_L, box_size=10, border=4)
    qr.add_data(url)
    qr.make(fit=True)
    img = qr.make_image(fill_color="black", back_color="white")
    return img

def print_qr_code(image):
    printer_name = win32print.GetDefaultPrinter()
    hDC = win32print.OpenPrinter(printer_name)
    try:
        win32print.StartDocPrinter(hDC, 1, ("QR Code", None, "RAW"))
        win32print.StartPagePrinter(hDC)
        dib = Image.core.save_image(image._getdata(), None, "win32ui")
        win32print.StretchDIBits(hDC, 0, 0, image.width, image.height, 0, 0, image.width, image.height, dib, Image.core.get_format_bpp(image.mode), win32print.SRCCOPY)
        win32print.EndPagePrinter(hDC)
        win32print.EndDocPrinter(hDC)
    finally:
        win32print.ClosePrinter(hDC)

if len(sys.argv) < 2:
    print("Usage: python qr_printer.py <url>")
    sys.exit()

url = sys.argv[1]
image = generate_qr_code(url)
print_qr_code(image)
