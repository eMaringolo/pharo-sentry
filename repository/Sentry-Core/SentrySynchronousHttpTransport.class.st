"
I am like the SentryHttpTransport, but I execute the HTTP requests without forking. This is useful when running as part of a CLI application that dies right after reporting the error.
"
Class {
	#name : #SentrySynchronousHttpTransport,
	#superclass : #SentryHttpTransport,
	#category : #'Sentry-Core-Model'
}

{ #category : #sending }
SentrySynchronousHttpTransport >> postClient: aZnClient [
	[ aZnClient post.
	self processResponse: aZnClient response ]
		on: NetworkError
		do: [ :ex | self processException: ex ]
]
