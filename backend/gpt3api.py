import openai

def search(text):
    apiKey = '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'

    openai.api_key = apiKey

    response = openai.Completion.create(
        model='text-davinci-003',
        prompt=text,
        temperature=0.7,
        max_tokens=256
    )

    return response['choices'][0]['text'].strip()