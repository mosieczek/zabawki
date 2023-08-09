import openai
openai.api_key = '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' 
response = openai.Image.create(
  prompt="Adrianna Osmólska w kosmosie",
  n=1,
  size="1024x1024"
)
image_url = response['data'][0]['url']

print(image_url)

# response = openai.ChatCompletion.create(
#   model="gpt-3.5-turbo",
#   messages=[
#         {"role": "system", "content": "piosenka o kobiecie o imieniu maja"},

#     ]
# )
# res = response['choices'][0]['message']['content']

# print(res)

# import torch
# import clip

# # ładujemy model OpenAI CLIP
# model, preprocess = clip.load('ViT-B/32', device='cpu')

# # lista dostępnych klas
# classes = ['cat', 'dog', 'horse', 'zebra']

# # wczytujemy obraz
# image = preprocess(Image.open('example_image.jpg')).unsqueeze(0)

# # wykorzystujemy model do klasyfikacji
# with torch.no_grad():
#     image_features = model.encode_image(image)
#     text_features = model.encode_text(clip.tokenize(classes))
#     logits_per_image, logits_per_text = model(image, text_features)
#     probs = logits_per_image.softmax(dim=1).cpu().numpy()

# # wyświetlamy wyniki
# for i in range(len(classes)):
#     print(f'{classes[i]}: {probs[0][i]}')