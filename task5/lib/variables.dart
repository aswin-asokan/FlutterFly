double totalPrize = 0;
String nameS = "",
    mobileS = "",
    mailS = "aswin@mail.com",
    passwordS = "",
    imageS = "assets/images/downloadfile-7.jpg",
    address = "";
double totPrize = 0;
bool checked = false;
bool noti = false;
//////////////////////////////////////////////////////
////Legal Text
List<String> termsHead = [
  "1. Acceptance of Terms",
  "2. User Account",
  "3. Use of the App",
  "4. Orders and Payments",
  "5. Returns and Refunds",
  "6. Intellectual Property",
  "7. Limitation of Liability",
  "8. Changes to the Terms",
  "9. Governing Law"
];
List<String> termsBody = [
  "By accessing or using the Pocket Dresses app, you agree to be bound by these Terms of Service. If you do not agree to these terms, please do not use the app.",
  "• You must create an account to use certain features of the app.\n• You are responsible for maintaining the confidentiality of your account information.\n• You agree to provide accurate and current information when creating your account.",
  "• The app is intended for personal, non-commercial use.\n• You agree not to use the app for any illegal or unauthorized purpose.\n• Pocket Dresses reserves the right to terminate your access to the app if you violate these terms.",
  "• All orders placed through the app are subject to acceptance and availability.\n• Prices and availability of products are subject to change without notice.",
  "• Please refer to our Return Policy for detailed information on returns and refunds.\n• We reserve the right to refuse a return or refund if the conditions of the Return Policy are not met.",
  "• All content on the app, including but not limited to text, graphics, logos, and images, is the property of Pocket Dresses.\n• You may not reproduce, distribute, or create derivative works from any content on the app without our express permission.",
  "• Pocket Dresses is not liable for any direct, indirect, incidental, or consequential damages arising from your use of the app.\n• We do not guarantee that the app will be error-free, secure, or available at all times.",
  "• Pocket Dresses reserves the right to modify these Terms of Service at any time.\n• Your continued use of the app after any changes signifies your acceptance of the new terms.",
  "These terms are governed by and construed in accordance with the laws of India, without regard to its conflict of law principles."
];
List<String> privacyHead = [
  "1. Information We Collect",
  "2. How We Use Your Information",
  "3. Sharing Your Information",
  "4. Security",
  "5. Changes to the Privacy Policy",
  "6. Contact Us",
];
List<String> privacyBody = [
  "• We collect personal information that you provide to us when creating an account, placing an order, or contacting customer service.\n• We may also collect non-personal information such as device type, browser type, and app usage data.",
  "• To process and fulfill your orders.\n• To improve the app and provide you with a better user experience.\n• To communicate with you about your account, orders, and promotions.",
  "• 3.1 We do not sell, trade, or otherwise transfer your personal information to outside parties except as required by law or to protect our rights.\n• We may share your information with trusted third parties who assist us in operating the app, conducting our business, or servicing you.",
  "We take reasonable precautions to protect your personal information from unauthorized access, use, or disclosure. However, no method of transmission over the Internet is completely secure.",
  "We may update this Privacy Policy from time to time. Any changes will be posted on this page, and your continued use of the app constitutes your acceptance of the revised policy.",
  "If you have any questions about this Privacy Policy, please contact us at pockectdress@mail.com.",
];
List<String> licenseHead = [
  "1. License",
  "2. Ownership",
  "3. Restrictions",
  "4. Termination",
  "5. Disclaimer of Warranties",
  "6. Limitation of Liability",
  "7. Governing Law"
];
List<String> licenseBody = [
  "• Pocket Dresses grants you a limited, non-exclusive, non-transferable license to use the app for personal, non-commercial purposes.\n• You may not modify, distribute, or create derivative works from the app without our express permission.",
  "• Pocket Dresses retains all rights, title, and interest in and to the app, including all intellectual property rights.\n• This License Agreement does not transfer any ownership rights to you.",
  "• You may not reverse engineer, decompile, or disassemble the app.\n• You may not remove or alter any proprietary notices on the app.",
  "• This License Agreement is effective until terminated by either party.\n• Pocket Dresses may terminate this agreement at any time if you violate its terms.\n• Upon termination, you must cease all use of the app and delete all copies from your devices.",
  "• The app is provided as is without any warranties of any kind.\n• Pocket Dresses disclaims all warranties, express or implied, including but not limited to warranties of merchantability and fitness for a particular purpose.",
  "• Pocket Dresses is not liable for any damages arising out of your use of the app.\n• Your sole remedy for dissatisfaction with the app is to stop using it.",
  "This License Agreement is governed by the laws of India, without regard to its conflict of law principles.",
];
String cancellation =
    "\t\t\t\tYou can cancel your order within 24 hours of placing it, as long as it hasn’t been processed or shipped yet. To cancel, simply contact our customer support team through pockectdress@mail.com or the app’s support section. If your cancellation is successful, we’ll refund your payment to your original payment method within 3-4 business days.\n\t\t\t\tOnce an order has been processed or shipped, it cannot be canceled. In this case, you may need to follow our Return Policy to return the item.\n\t\t\t\tPocket Dresses may cancel your order under certain conditions, such as if the item is out of stock, there was an error in the pricing or product description, or if we detect any suspicious activity. If we cancel your order, we’ll notify you and issue a full refund to your original payment method within 3-4 business days.\n\t\t\t\tSome items may not be eligible for cancellation or refund, including customized or personalized products, or items bought during special sales. These details will be clearly mentioned on the product page.\n\t\t\t\tIf you need to change details of your order, like the shipping address or product size, please contact us as soon as possible. Once an order is processed or shipped, changes may not be possible.\n\t\t\t\tFor any questions or concerns, feel free to reach out to us at pockectdress@mail.com. Our customer support team is available during 7am to 7pm to assist you.\n\t\t\t\tWe may update this Cancellation Policy from time to time. Any changes will be effective immediately when posted on the app. By continuing to use the app, you agree to the updated policy.";
String returnPolicy =
    "\t\t\t\tWe want you to be happy with your purchase! If you're not satisfied with an item, you can return it within [specified time, e.g., 14 days] of delivery, as long as the item is in its original condition—unworn, unwashed, and with all tags attached.\t\t\t\t\nCertain items are not eligible for return. These include customized or personalized products, items marked as \"Final Sale,\" and gift cards. Details about non-returnable items will be clearly mentioned on the product page, so please check before making a purchase.\t\t\t\t\nTo initiate a return, please contact our customer support team at pockectdress@mail.com or through the app’s support section. Provide your order number and details of the item(s) you wish to return, and our team will guide you through the process, including providing a return authorization and shipping instructions.\t\t\t\t\nPlease note that you are responsible for the cost of return shipping unless the return is due to a defect or an error on our part. We recommend using a trackable shipping method to ensure your return is safely delivered to us. Additionally, original shipping charges are non-refundable.\t\t\t\t\nOnce we receive and inspect the returned item(s), we will process your refund. Refunds will be issued to your original payment method within 3-4 business days. You will receive a confirmation email once the refund is processed.\t\t\t\t\nIf you wish to exchange an item for a different size or color, please return the original item following the steps above and place a new order for the desired item.\t\t\t\t\nIf you receive an item that is damaged or defective, please contact us immediately at pockectdress@mail.com. We will arrange for a return and provide a full refund or replacement at no additional cost to you.\t\t\t\t\nFor any questions or concerns about your return, feel free to reach out to us at pockectdress@mail.com. Our customer support team is available during 7am to 7pm to assist you.";
