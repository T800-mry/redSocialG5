from storages.backends.s3 import S3Boto3Estorage

class StaticStorage(S3Boto3Estorage):
    location = 'static'
    default_acl = 'private'

class PublicMediaStorage(S3Boto3Estorage):
    location = 'static'
    default_acl = 'private'
    file_overwrite = False