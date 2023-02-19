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