import os

POSTGRES_DB_CONFIG =  {
    "ENGINE": "django.db.backends.postgresql",
    "NAME": os.environ.get("POSTGRES_NAME", ""),
    "USER": os.environ.get("POSTGRES_USER", ""),
    "PASSWORD": os.environ.get("POSTGRES_PASSWORD", ""),
    "HOST": os.environ.get("POSTGRES_HOST", ""),
    "PORT": os.environ.get("POSTGRES_PORT", ""),
}