from django.forms import ValidationError


def get_path_upload_avatar(instance, file):
    """
    make file root 
    """
    print(instance)
    return f'avatar/{instance.phone}/{file}'

def validate_size_image(file):
    """
    checks file size permission
    """

    MB_LIMIT = 2

    if file.size > MB_LIMIT * 1024 * 1024:
        raise ValidationError(f"Maximum file size is {MB_LIMIT}MB")

