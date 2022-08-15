from foo.bar import get_example


# Lambda entrypoint
def lambda_handler(event, context):   
    msg = get_example()
    return msg


# Local entrypoint
if __name__ == '__main__':
    msg = get_example()
    print(msg)
