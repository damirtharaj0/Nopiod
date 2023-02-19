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