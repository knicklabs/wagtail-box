# Wagtail Box

This is a Vagrant box that can be used for building sites with the 
Wagtail CMS.

## Create a Site with Postgresql and ElasticSearch
 
Scaffold the project and create a virtual environment. 
 
```
vagrant ssh
cd /vagrant
wagtail start site_name
cd site_name
virtualenv venv
source venv/bin/activate
```
 
Add the following dependencies to `requirements.txt`.
  
```
psycopg2>=2.6.1,<3.0.0
elasticsearch>=1.0.0,<2.0.0
```

Install the dependencies.

```
pip3 install -r requirements.txt
```

Create a Postgresql database.

```
createdb -Uvagrant site_name
```

Configure the database by modifying the `DATABASES = ` in 
`site_name/settings/base.py`.

```
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': 'site_name',
        'USER': 'vagrant',
        'PASSWORD': 'vagrant',
        'HOST': '',
        'PORT': '',
        'CONN_MAX_AGE': 600
    }
}
```

Migrate the database.

```
./manage.py migrate
```

Create a superuser by running the following and following the prompts.

```
./manage.py createsuperuser
```

Configure ElasticSearch by adding the following in 
`site_name/settings/base.py`.
 
```
WAGTAILSEARCH_BACKENDS = {
    'default': {
        'BACKEND': 'wagtail.wagtailsearch.backends.elasticsearch',
        'URLS': ['http://localhost:9200'],
        'INDEX': 'site_name',
        'TIMEOUT': 5,
    }
}
```

Update the ElasticSearch indexes.

```
./manage.py update_index
```

## Working with a Site

Make sure you source the virtual environment.

```
source venv/bin/activate
```

## Running a Site

```
python3 manage.py runserver 0.0.0.0:8000
```

Visit [http://localhost:8000](http://localhost:8000) in your browser.