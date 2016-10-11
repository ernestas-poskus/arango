package arangolite

import "errors"

//-
var (
	ErrNoError                                           = errors.New("ERROR_NO_ERROR")
	ErrFailed                                            = errors.New("ERROR_FAILED")
	ErrSysError                                          = errors.New("ERROR_SYS_ERROR")
	ErrOutOfMemory                                       = errors.New("ERROR_OUT_OF_MEMORY")
	ErrInternal                                          = errors.New("ERROR_INTERNAL")
	ErrIllegalNumber                                     = errors.New("ERROR_ILLEGAL_NUMBER")
	ErrNumericOverflow                                   = errors.New("ERROR_NUMERIC_OVERFLOW")
	ErrIllegalOption                                     = errors.New("ERROR_ILLEGAL_OPTION")
	ErrDeadPid                                           = errors.New("ERROR_DEAD_PID")
	ErrNotImplemented                                    = errors.New("ERROR_NOT_IMPLEMENTED")
	ErrBadParameter                                      = errors.New("ERROR_BAD_PARAMETER")
	ErrForbidden                                         = errors.New("ERROR_FORBIDDEN")
	ErrOutOfMemoryMmap                                   = errors.New("ERROR_OUT_OF_MEMORY_MMAP")
	ErrCorruptedCsv                                      = errors.New("ERROR_CORRUPTED_CSV")
	ErrFileNotFound                                      = errors.New("ERROR_FILE_NOT_FOUND")
	ErrCannotWriteFile                                   = errors.New("ERROR_CANNOT_WRITE_FILE")
	ErrCannotOverwriteFile                               = errors.New("ERROR_CANNOT_OVERWRITE_FILE")
	ErrTypeError                                         = errors.New("ERROR_TYPE_ERROR")
	ErrLockTimeout                                       = errors.New("ERROR_LOCK_TIMEOUT")
	ErrCannotCreateDirectory                             = errors.New("ERROR_CANNOT_CREATE_DIRECTORY")
	ErrCannotCreateTempFile                              = errors.New("ERROR_CANNOT_CREATE_TEMP_FILE")
	ErrRequestCanceled                                   = errors.New("ERROR_REQUEST_CANCELED")
	ErrDebug                                             = errors.New("ERROR_DEBUG")
	ErrIpAddressInvalid                                  = errors.New("ERROR_IP_ADDRESS_INVALID")
	ErrFileExists                                        = errors.New("ERROR_FILE_EXISTS")
	ErrLocked                                            = errors.New("ERROR_LOCKED")
	ErrDeadlock                                          = errors.New("ERROR_DEADLOCK")
	ErrShuttingDown                                      = errors.New("ERROR_SHUTTING_DOWN")
	ErrHttpBadParameter                                  = errors.New("ERROR_HTTP_BAD_PARAMETER")
	ErrHttpUnauthorized                                  = errors.New("ERROR_HTTP_UNAUTHORIZED")
	ErrHttpForbidden                                     = errors.New("ERROR_HTTP_FORBIDDEN")
	ErrHttpNotFound                                      = errors.New("ERROR_HTTP_NOT_FOUND")
	ErrHttpMethodNotAllowed                              = errors.New("ERROR_HTTP_METHOD_NOT_ALLOWED")
	ErrHttpPreconditionFailed                            = errors.New("ERROR_HTTP_PRECONDITION_FAILED")
	ErrHttpServerError                                   = errors.New("ERROR_HTTP_SERVER_ERROR")
	ErrHttpCorruptedJson                                 = errors.New("ERROR_HTTP_CORRUPTED_JSON")
	ErrHttpSuperfluousSuffices                           = errors.New("ERROR_HTTP_SUPERFLUOUS_SUFFICES")
	ErrArangoIllegalState                                = errors.New("ERROR_ARANGO_ILLEGAL_STATE")
	ErrArangoDatafileSealed                              = errors.New("ERROR_ARANGO_DATAFILE_SEALED")
	ErrArangoUnknownCollectionType                       = errors.New("ERROR_ARANGO_UNKNOWN_COLLECTION_TYPE")
	ErrArangoReadOnly                                    = errors.New("ERROR_ARANGO_READ_ONLY")
	ErrArangoDuplicateIdentifier                         = errors.New("ERROR_ARANGO_DUPLICATE_IDENTIFIER")
	ErrArangoDatafileUnreadable                          = errors.New("ERROR_ARANGO_DATAFILE_UNREADABLE")
	ErrArangoDatafileEmpty                               = errors.New("ERROR_ARANGO_DATAFILE_EMPTY")
	ErrArangoRecovery                                    = errors.New("ERROR_ARANGO_RECOVERY")
	ErrArangoCorruptedDatafile                           = errors.New("ERROR_ARANGO_CORRUPTED_DATAFILE")
	ErrArangoIllegalParameterFile                        = errors.New("ERROR_ARANGO_ILLEGAL_PARAMETER_FILE")
	ErrArangoCorruptedCollection                         = errors.New("ERROR_ARANGO_CORRUPTED_COLLECTION")
	ErrArangoMmapFailed                                  = errors.New("ERROR_ARANGO_MMAP_FAILED")
	ErrArangoFilesystemFull                              = errors.New("ERROR_ARANGO_FILESYSTEM_FULL")
	ErrArangoNoJournal                                   = errors.New("ERROR_ARANGO_NO_JOURNAL")
	ErrArangoDatafileAlreadyExists                       = errors.New("ERROR_ARANGO_DATAFILE_ALREADY_EXISTS")
	ErrArangoDatadirLocked                               = errors.New("ERROR_ARANGO_DATADIR_LOCKED")
	ErrArangoCollectionDirectoryAlreadyExists            = errors.New("ERROR_ARANGO_COLLECTION_DIRECTORY_ALREADY_EXISTS")
	ErrArangoMsyncFailed                                 = errors.New("ERROR_ARANGO_MSYNC_FAILED")
	ErrArangoDatadirUnlockable                           = errors.New("ERROR_ARANGO_DATADIR_UNLOCKABLE")
	ErrArangoSyncTimeout                                 = errors.New("ERROR_ARANGO_SYNC_TIMEOUT")
	ErrArangoConflict                                    = errors.New("ERROR_ARANGO_CONFLICT")
	ErrArangoDatadirInvalid                              = errors.New("ERROR_ARANGO_DATADIR_INVALID")
	ErrArangoDocumentNotFound                            = errors.New("ERROR_ARANGO_DOCUMENT_NOT_FOUND")
	ErrArangoCollectionNotFound                          = errors.New("ERROR_ARANGO_COLLECTION_NOT_FOUND")
	ErrArangoCollectionParameterMissing                  = errors.New("ERROR_ARANGO_COLLECTION_PARAMETER_MISSING")
	ErrArangoDocumentHandleBad                           = errors.New("ERROR_ARANGO_DOCUMENT_HANDLE_BAD")
	ErrArangoMaximalSizeTooSmall                         = errors.New("ERROR_ARANGO_MAXIMAL_SIZE_TOO_SMALL")
	ErrArangoDuplicateName                               = errors.New("ERROR_ARANGO_DUPLICATE_NAME")
	ErrArangoIllegalName                                 = errors.New("ERROR_ARANGO_ILLEGAL_NAME")
	ErrArangoNoIndex                                     = errors.New("ERROR_ARANGO_NO_INDEX")
	ErrArangoUniqueConstraintViolated                    = errors.New("ERROR_ARANGO_UNIQUE_CONSTRAINT_VIOLATED")
	ErrArangoIndexNotFound                               = errors.New("ERROR_ARANGO_INDEX_NOT_FOUND")
	ErrArangoCrossCollectionRequest                      = errors.New("ERROR_ARANGO_CROSS_COLLECTION_REQUEST")
	ErrArangoIndexHandleBad                              = errors.New("ERROR_ARANGO_INDEX_HANDLE_BAD")
	ErrArangoDocumentTooLarge                            = errors.New("ERROR_ARANGO_DOCUMENT_TOO_LARGE")
	ErrArangoCollectionNotUnloaded                       = errors.New("ERROR_ARANGO_COLLECTION_NOT_UNLOADED")
	ErrArangoCollectionTypeInvalid                       = errors.New("ERROR_ARANGO_COLLECTION_TYPE_INVALID")
	ErrArangoValidationFailed                            = errors.New("ERROR_ARANGO_VALIDATION_FAILED")
	ErrArangoAttributeParserFailed                       = errors.New("ERROR_ARANGO_ATTRIBUTE_PARSER_FAILED")
	ErrArangoDocumentKeyBad                              = errors.New("ERROR_ARANGO_DOCUMENT_KEY_BAD")
	ErrArangoDocumentKeyUnexpected                       = errors.New("ERROR_ARANGO_DOCUMENT_KEY_UNEXPECTED")
	ErrArangoDatadirNotWritable                          = errors.New("ERROR_ARANGO_DATADIR_NOT_WRITABLE")
	ErrArangoOutOfKeys                                   = errors.New("ERROR_ARANGO_OUT_OF_KEYS")
	ErrArangoDocumentKeyMissing                          = errors.New("ERROR_ARANGO_DOCUMENT_KEY_MISSING")
	ErrArangoDocumentTypeInvalid                         = errors.New("ERROR_ARANGO_DOCUMENT_TYPE_INVALID")
	ErrArangoDatabaseNotFound                            = errors.New("ERROR_ARANGO_DATABASE_NOT_FOUND")
	ErrArangoDatabaseNameInvalid                         = errors.New("ERROR_ARANGO_DATABASE_NAME_INVALID")
	ErrArangoUseSystemDatabase                           = errors.New("ERROR_ARANGO_USE_SYSTEM_DATABASE")
	ErrArangoEndpointNotFound                            = errors.New("ERROR_ARANGO_ENDPOINT_NOT_FOUND")
	ErrArangoInvalidKeyGenerator                         = errors.New("ERROR_ARANGO_INVALID_KEY_GENERATOR")
	ErrArangoInvalidEdgeAttribute                        = errors.New("ERROR_ARANGO_INVALID_EDGE_ATTRIBUTE")
	ErrArangoIndexDocumentAttributeMissing               = errors.New("ERROR_ARANGO_INDEX_DOCUMENT_ATTRIBUTE_MISSING")
	ErrArangoIndexCreationFailed                         = errors.New("ERROR_ARANGO_INDEX_CREATION_FAILED")
	ErrArangoWriteThrottleTimeout                        = errors.New("ERROR_ARANGO_WRITE_THROTTLE_TIMEOUT")
	ErrArangoCollectionTypeMismatch                      = errors.New("ERROR_ARANGO_COLLECTION_TYPE_MISMATCH")
	ErrArangoCollectionNotLoaded                         = errors.New("ERROR_ARANGO_COLLECTION_NOT_LOADED")
	ErrArangoDocumentRevBad                              = errors.New("ERROR_ARANGO_DOCUMENT_REV_BAD")
	ErrArangoDatafileFull                                = errors.New("ERROR_ARANGO_DATAFILE_FULL")
	ErrArangoEmptyDatadir                                = errors.New("ERROR_ARANGO_EMPTY_DATADIR")
	ErrReplicationNoResponse                             = errors.New("ERROR_REPLICATION_NO_RESPONSE")
	ErrReplicationInvalidResponse                        = errors.New("ERROR_REPLICATION_INVALID_RESPONSE")
	ErrReplicationMasterError                            = errors.New("ERROR_REPLICATION_MASTER_ERROR")
	ErrReplicationMasterIncompatible                     = errors.New("ERROR_REPLICATION_MASTER_INCOMPATIBLE")
	ErrReplicationMasterChange                           = errors.New("ERROR_REPLICATION_MASTER_CHANGE")
	ErrReplicationLoop                                   = errors.New("ERROR_REPLICATION_LOOP")
	ErrReplicationUnexpectedMarker                       = errors.New("ERROR_REPLICATION_UNEXPECTED_MARKER")
	ErrReplicationInvalidApplierState                    = errors.New("ERROR_REPLICATION_INVALID_APPLIER_STATE")
	ErrReplicationUnexpectedTransaction                  = errors.New("ERROR_REPLICATION_UNEXPECTED_TRANSACTION")
	ErrReplicationInvalidApplierConfiguration            = errors.New("ERROR_REPLICATION_INVALID_APPLIER_CONFIGURATION")
	ErrReplicationRunning                                = errors.New("ERROR_REPLICATION_RUNNING")
	ErrReplicationApplierStopped                         = errors.New("ERROR_REPLICATION_APPLIER_STOPPED")
	ErrReplicationNoStartTick                            = errors.New("ERROR_REPLICATION_NO_START_TICK")
	ErrReplicationStartTickNotPresent                    = errors.New("ERROR_REPLICATION_START_TICK_NOT_PRESENT")
	ErrClusterNoAgency                                   = errors.New("ERROR_CLUSTER_NO_AGENCY")
	ErrClusterNoCoordinatorHeader                        = errors.New("ERROR_CLUSTER_NO_COORDINATOR_HEADER")
	ErrClusterCouldNotLockPlan                           = errors.New("ERROR_CLUSTER_COULD_NOT_LOCK_PLAN")
	ErrClusterCollectionIdExists                         = errors.New("ERROR_CLUSTER_COLLECTION_ID_EXISTS")
	ErrClusterCouldNotCreateCollectionInPlan             = errors.New("ERROR_CLUSTER_COULD_NOT_CREATE_COLLECTION_IN_PLAN")
	ErrClusterCouldNotReadCurrentVersion                 = errors.New("ERROR_CLUSTER_COULD_NOT_READ_CURRENT_VERSION")
	ErrClusterCouldNotCreateCollection                   = errors.New("ERROR_CLUSTER_COULD_NOT_CREATE_COLLECTION")
	ErrClusterTimeout                                    = errors.New("ERROR_CLUSTER_TIMEOUT")
	ErrClusterCouldNotRemoveCollectionInPlan             = errors.New("ERROR_CLUSTER_COULD_NOT_REMOVE_COLLECTION_IN_PLAN")
	ErrClusterCouldNotRemoveCollectionInCurrent          = errors.New("ERROR_CLUSTER_COULD_NOT_REMOVE_COLLECTION_IN_CURRENT")
	ErrClusterCouldNotCreateDatabaseInPlan               = errors.New("ERROR_CLUSTER_COULD_NOT_CREATE_DATABASE_IN_PLAN")
	ErrClusterCouldNotCreateDatabase                     = errors.New("ERROR_CLUSTER_COULD_NOT_CREATE_DATABASE")
	ErrClusterCouldNotRemoveDatabaseInPlan               = errors.New("ERROR_CLUSTER_COULD_NOT_REMOVE_DATABASE_IN_PLAN")
	ErrClusterCouldNotRemoveDatabaseInCurrent            = errors.New("ERROR_CLUSTER_COULD_NOT_REMOVE_DATABASE_IN_CURRENT")
	ErrClusterShardGone                                  = errors.New("ERROR_CLUSTER_SHARD_GONE")
	ErrClusterConnectionLost                             = errors.New("ERROR_CLUSTER_CONNECTION_LOST")
	ErrClusterMustNotSpecifyKey                          = errors.New("ERROR_CLUSTER_MUST_NOT_SPECIFY_KEY")
	ErrClusterGotContradictingAnswers                    = errors.New("ERROR_CLUSTER_GOT_CONTRADICTING_ANSWERS")
	ErrClusterNotAllShardingAttributesGiven              = errors.New("ERROR_CLUSTER_NOT_ALL_SHARDING_ATTRIBUTES_GIVEN")
	ErrClusterMustNotChangeShardingAttributes            = errors.New("ERROR_CLUSTER_MUST_NOT_CHANGE_SHARDING_ATTRIBUTES")
	ErrClusterUnsupported                                = errors.New("ERROR_CLUSTER_UNSUPPORTED")
	ErrClusterOnlyOnCoordinator                          = errors.New("ERROR_CLUSTER_ONLY_ON_COORDINATOR")
	ErrClusterReadingPlanAgency                          = errors.New("ERROR_CLUSTER_READING_PLAN_AGENCY")
	ErrClusterCouldNotTruncateCollection                 = errors.New("ERROR_CLUSTER_COULD_NOT_TRUNCATE_COLLECTION")
	ErrClusterAqlCommunication                           = errors.New("ERROR_CLUSTER_AQL_COMMUNICATION")
	ErrArangoDocumentNotFoundOrShardingAttributesChanged = errors.New("ERROR_ARANGO_DOCUMENT_NOT_FOUND_OR_SHARDING_ATTRIBUTES_CHANGED")
	ErrClusterCouldNotDetermineId                        = errors.New("ERROR_CLUSTER_COULD_NOT_DETERMINE_ID")
	ErrClusterOnlyOnDbserver                             = errors.New("ERROR_CLUSTER_ONLY_ON_DBSERVER")
	ErrClusterBackendUnavailable                         = errors.New("ERROR_CLUSTER_BACKEND_UNAVAILABLE")
	ErrClusterUnknownCallbackEndpoint                    = errors.New("ERROR_CLUSTER_UNKNOWN_CALLBACK_ENDPOINT")
	ErrClusterAgencyStructureInvalid                     = errors.New("ERROR_CLUSTER_AGENCY_STRUCTURE_INVALID")
	ErrQueryKilled                                       = errors.New("ERROR_QUERY_KILLED")
	ErrQueryParse                                        = errors.New("ERROR_QUERY_PARSE")
	ErrQueryEmpty                                        = errors.New("ERROR_QUERY_EMPTY")
	ErrQueryScript                                       = errors.New("ERROR_QUERY_SCRIPT")
	ErrQueryNumberOutOfRange                             = errors.New("ERROR_QUERY_NUMBER_OUT_OF_RANGE")
	ErrQueryVariableNameInvalid                          = errors.New("ERROR_QUERY_VARIABLE_NAME_INVALID")
	ErrQueryVariableRedeclared                           = errors.New("ERROR_QUERY_VARIABLE_REDECLARED")
	ErrQueryVariableNameUnknown                          = errors.New("ERROR_QUERY_VARIABLE_NAME_UNKNOWN")
	ErrQueryCollectionLockFailed                         = errors.New("ERROR_QUERY_COLLECTION_LOCK_FAILED")
	ErrQueryTooManyCollections                           = errors.New("ERROR_QUERY_TOO_MANY_COLLECTIONS")
	ErrQueryDocumentAttributeRedeclared                  = errors.New("ERROR_QUERY_DOCUMENT_ATTRIBUTE_REDECLARED")
	ErrQueryFunctionNameUnknown                          = errors.New("ERROR_QUERY_FUNCTION_NAME_UNKNOWN")
	ErrQueryFunctionArgumentNumberMismatch               = errors.New("ERROR_QUERY_FUNCTION_ARGUMENT_NUMBER_MISMATCH")
	ErrQueryFunctionArgumentTypeMismatch                 = errors.New("ERROR_QUERY_FUNCTION_ARGUMENT_TYPE_MISMATCH")
	ErrQueryInvalidRegex                                 = errors.New("ERROR_QUERY_INVALID_REGEX")
	ErrQueryBindParametersInvalid                        = errors.New("ERROR_QUERY_BIND_PARAMETERS_INVALID")
	ErrQueryBindParameterMissing                         = errors.New("ERROR_QUERY_BIND_PARAMETER_MISSING")
	ErrQueryBindParameterUndeclared                      = errors.New("ERROR_QUERY_BIND_PARAMETER_UNDECLARED")
	ErrQueryBindParameterType                            = errors.New("ERROR_QUERY_BIND_PARAMETER_TYPE")
	ErrQueryInvalidLogicalValue                          = errors.New("ERROR_QUERY_INVALID_LOGICAL_VALUE")
	ErrQueryInvalidArithmeticValue                       = errors.New("ERROR_QUERY_INVALID_ARITHMETIC_VALUE")
	ErrQueryDivisionByZero                               = errors.New("ERROR_QUERY_DIVISION_BY_ZERO")
	ErrQueryArrayExpected                                = errors.New("ERROR_QUERY_ARRAY_EXPECTED")
	ErrQueryFailCalled                                   = errors.New("ERROR_QUERY_FAIL_CALLED")
	ErrQueryGeoIndexMissing                              = errors.New("ERROR_QUERY_GEO_INDEX_MISSING")
	ErrQueryFulltextIndexMissing                         = errors.New("ERROR_QUERY_FULLTEXT_INDEX_MISSING")
	ErrQueryInvalidDateValue                             = errors.New("ERROR_QUERY_INVALID_DATE_VALUE")
	ErrQueryMultiModify                                  = errors.New("ERROR_QUERY_MULTI_MODIFY")
	ErrQueryInvalidAggregateExpression                   = errors.New("ERROR_QUERY_INVALID_AGGREGATE_EXPRESSION")
	ErrQueryCompileTimeOptions                           = errors.New("ERROR_QUERY_COMPILE_TIME_OPTIONS")
	ErrQueryExceptionOptions                             = errors.New("ERROR_QUERY_EXCEPTION_OPTIONS")
	ErrQueryCollectionUsedInExpression                   = errors.New("ERROR_QUERY_COLLECTION_USED_IN_EXPRESSION")
	ErrQueryDisallowedDynamicCall                        = errors.New("ERROR_QUERY_DISALLOWED_DYNAMIC_CALL")
	ErrQueryAccessAfterModification                      = errors.New("ERROR_QUERY_ACCESS_AFTER_MODIFICATION")
	ErrQueryFunctionInvalidName                          = errors.New("ERROR_QUERY_FUNCTION_INVALID_NAME")
	ErrQueryFunctionInvalidCode                          = errors.New("ERROR_QUERY_FUNCTION_INVALID_CODE")
	ErrQueryFunctionNotFound                             = errors.New("ERROR_QUERY_FUNCTION_NOT_FOUND")
	ErrQueryFunctionRuntimeError                         = errors.New("ERROR_QUERY_FUNCTION_RUNTIME_ERROR")
	ErrQueryBadJsonPlan                                  = errors.New("ERROR_QUERY_BAD_JSON_PLAN")
	ErrQueryNotFound                                     = errors.New("ERROR_QUERY_NOT_FOUND")
	ErrQueryInUse                                        = errors.New("ERROR_QUERY_IN_USE")
	ErrCursorNotFound                                    = errors.New("ERROR_CURSOR_NOT_FOUND")
	ErrCursorBusy                                        = errors.New("ERROR_CURSOR_BUSY")
	ErrTransactionInternal                               = errors.New("ERROR_TRANSACTION_INTERNAL")
	ErrTransactionNested                                 = errors.New("ERROR_TRANSACTION_NESTED")
	ErrTransactionUnregisteredCollection                 = errors.New("ERROR_TRANSACTION_UNREGISTERED_COLLECTION")
	ErrTransactionDisallowedOperation                    = errors.New("ERROR_TRANSACTION_DISALLOWED_OPERATION")
	ErrTransactionAborted                                = errors.New("ERROR_TRANSACTION_ABORTED")
	ErrUserInvalidName                                   = errors.New("ERROR_USER_INVALID_NAME")
	ErrUserInvalidPassword                               = errors.New("ERROR_USER_INVALID_PASSWORD")
	ErrUserDuplicate                                     = errors.New("ERROR_USER_DUPLICATE")
	ErrUserNotFound                                      = errors.New("ERROR_USER_NOT_FOUND")
	ErrUserChangePassword                                = errors.New("ERROR_USER_CHANGE_PASSWORD")
	ErrServiceInvalidName                                = errors.New("ERROR_SERVICE_INVALID_NAME")
	ErrServiceInvalidMount                               = errors.New("ERROR_SERVICE_INVALID_MOUNT")
	ErrServiceDownloadFailed                             = errors.New("ERROR_SERVICE_DOWNLOAD_FAILED")
	ErrServiceUploadFailed                               = errors.New("ERROR_SERVICE_UPLOAD_FAILED")
	ErrKeyvalueInvalidKey                                = errors.New("ERROR_KEYVALUE_INVALID_KEY")
	ErrKeyvalueKeyExists                                 = errors.New("ERROR_KEYVALUE_KEY_EXISTS")
	ErrKeyvalueKeyNotFound                               = errors.New("ERROR_KEYVALUE_KEY_NOT_FOUND")
	ErrKeyvalueKeyNotUnique                              = errors.New("ERROR_KEYVALUE_KEY_NOT_UNIQUE")
	ErrKeyvalueKeyNotChanged                             = errors.New("ERROR_KEYVALUE_KEY_NOT_CHANGED")
	ErrKeyvalueKeyNotRemoved                             = errors.New("ERROR_KEYVALUE_KEY_NOT_REMOVED")
	ErrKeyvalueNoValue                                   = errors.New("ERROR_KEYVALUE_NO_VALUE")
	ErrTaskInvalidId                                     = errors.New("ERROR_TASK_INVALID_ID")
	ErrTaskDuplicateId                                   = errors.New("ERROR_TASK_DUPLICATE_ID")
	ErrTaskNotFound                                      = errors.New("ERROR_TASK_NOT_FOUND")
	ErrGraphInvalidGraph                                 = errors.New("ERROR_GRAPH_INVALID_GRAPH")
	ErrGraphCouldNotCreateGraph                          = errors.New("ERROR_GRAPH_COULD_NOT_CREATE_GRAPH")
	ErrGraphInvalidVertex                                = errors.New("ERROR_GRAPH_INVALID_VERTEX")
	ErrGraphCouldNotCreateVertex                         = errors.New("ERROR_GRAPH_COULD_NOT_CREATE_VERTEX")
	ErrGraphCouldNotChangeVertex                         = errors.New("ERROR_GRAPH_COULD_NOT_CHANGE_VERTEX")
	ErrGraphInvalidEdge                                  = errors.New("ERROR_GRAPH_INVALID_EDGE")
	ErrGraphCouldNotCreateEdge                           = errors.New("ERROR_GRAPH_COULD_NOT_CREATE_EDGE")
	ErrGraphCouldNotChangeEdge                           = errors.New("ERROR_GRAPH_COULD_NOT_CHANGE_EDGE")
	ErrGraphTooManyIterations                            = errors.New("ERROR_GRAPH_TOO_MANY_ITERATIONS")
	ErrGraphInvalidFilterResult                          = errors.New("ERROR_GRAPH_INVALID_FILTER_RESULT")
	ErrGraphCollectionMultiUse                           = errors.New("ERROR_GRAPH_COLLECTION_MULTI_USE")
	ErrGraphCollectionUseInMultiGraphs                   = errors.New("ERROR_GRAPH_COLLECTION_USE_IN_MULTI_GRAPHS")
	ErrGraphCreateMissingName                            = errors.New("ERROR_GRAPH_CREATE_MISSING_NAME")
	ErrGraphCreateMalformedEdgeDefinition                = errors.New("ERROR_GRAPH_CREATE_MALFORMED_EDGE_DEFINITION")
	ErrGraphNotFound                                     = errors.New("ERROR_GRAPH_NOT_FOUND")
	ErrGraphDuplicate                                    = errors.New("ERROR_GRAPH_DUPLICATE")
	ErrGraphVertexColDoesNotExist                        = errors.New("ERROR_GRAPH_VERTEX_COL_DOES_NOT_EXIST")
	ErrGraphWrongCollectionTypeVertex                    = errors.New("ERROR_GRAPH_WRONG_COLLECTION_TYPE_VERTEX")
	ErrGraphNotInOrphanCollection                        = errors.New("ERROR_GRAPH_NOT_IN_ORPHAN_COLLECTION")
	ErrGraphCollectionUsedInEdgeDef                      = errors.New("ERROR_GRAPH_COLLECTION_USED_IN_EDGE_DEF")
	ErrGraphEdgeCollectionNotUsed                        = errors.New("ERROR_GRAPH_EDGE_COLLECTION_NOT_USED")
	ErrGraphNotAnArangoCollection                        = errors.New("ERROR_GRAPH_NOT_AN_ARANGO_COLLECTION")
	ErrGraphNoGraphCollection                            = errors.New("ERROR_GRAPH_NO_GRAPH_COLLECTION")
	ErrGraphInvalidExampleArrayObjectString              = errors.New("ERROR_GRAPH_INVALID_EXAMPLE_ARRAY_OBJECT_STRING")
	ErrGraphInvalidExampleArrayObject                    = errors.New("ERROR_GRAPH_INVALID_EXAMPLE_ARRAY_OBJECT")
	ErrGraphInvalidNumberOfArguments                     = errors.New("ERROR_GRAPH_INVALID_NUMBER_OF_ARGUMENTS")
	ErrGraphInvalidParameter                             = errors.New("ERROR_GRAPH_INVALID_PARAMETER")
	ErrGraphInvalidId                                    = errors.New("ERROR_GRAPH_INVALID_ID")
	ErrGraphCollectionUsedInOrphans                      = errors.New("ERROR_GRAPH_COLLECTION_USED_IN_ORPHANS")
	ErrGraphEdgeColDoesNotExist                          = errors.New("ERROR_GRAPH_EDGE_COL_DOES_NOT_EXIST")
	ErrGraphEmpty                                        = errors.New("ERROR_GRAPH_EMPTY")
	ErrSessionUnknown                                    = errors.New("ERROR_SESSION_UNKNOWN")
	ErrSessionExpired                                    = errors.New("ERROR_SESSION_EXPIRED")
	ErrSimpleClientUnknownError                          = errors.New("SIMPLE_CLIENT_UNKNOWN_ERROR")
	ErrSimpleClientCouldNotConnect                       = errors.New("SIMPLE_CLIENT_COULD_NOT_CONNECT")
	ErrSimpleClientCouldNotWrite                         = errors.New("SIMPLE_CLIENT_COULD_NOT_WRITE")
	ErrSimpleClientCouldNotRead                          = errors.New("SIMPLE_CLIENT_COULD_NOT_READ")
	ErrMalformedManifestFile                             = errors.New("ERROR_MALFORMED_MANIFEST_FILE")
	ErrInvalidServiceManifest                            = errors.New("ERROR_INVALID_SERVICE_MANIFEST")
	ErrInvalidFoxxOptions                                = errors.New("ERROR_INVALID_FOXX_OPTIONS")
	ErrInvalidMountpoint                                 = errors.New("ERROR_INVALID_MOUNTPOINT")
	ErrServiceNotFound                                   = errors.New("ERROR_SERVICE_NOT_FOUND")
	ErrServiceNeedsConfiguration                         = errors.New("ERROR_SERVICE_NEEDS_CONFIGURATION")
	ErrServiceMountpointConflict                         = errors.New("ERROR_SERVICE_MOUNTPOINT_CONFLICT")
	ErrModuleNotFound                                    = errors.New("ERROR_MODULE_NOT_FOUND")
	ErrModuleFailure                                     = errors.New("ERROR_MODULE_FAILURE")
	ErrResultElementExists                               = errors.New("RESULT_ELEMENT_EXISTS")
	ErrResultElementNotFound                             = errors.New("RESULT_ELEMENT_NOT_FOUND")
	ErrQueueAlreadyExists                                = errors.New("ERROR_QUEUE_ALREADY_EXISTS")
	ErrDispatcherIsStopping                              = errors.New("ERROR_DISPATCHER_IS_STOPPING")
	ErrQueueUnknown                                      = errors.New("ERROR_QUEUE_UNKNOWN")
	ErrQueueFull                                         = errors.New("ERROR_QUEUE_FULL")

	arangoErrors = map[int]error{
		0:     ErrNoError,
		1:     ErrFailed,
		2:     ErrSysError,
		3:     ErrOutOfMemory,
		4:     ErrInternal,
		5:     ErrIllegalNumber,
		6:     ErrNumericOverflow,
		7:     ErrIllegalOption,
		8:     ErrDeadPid,
		9:     ErrNotImplemented,
		10:    ErrBadParameter,
		11:    ErrForbidden,
		12:    ErrOutOfMemoryMmap,
		13:    ErrCorruptedCsv,
		14:    ErrFileNotFound,
		15:    ErrCannotWriteFile,
		16:    ErrCannotOverwriteFile,
		17:    ErrTypeError,
		18:    ErrLockTimeout,
		19:    ErrCannotCreateDirectory,
		20:    ErrCannotCreateTempFile,
		21:    ErrRequestCanceled,
		22:    ErrDebug,
		25:    ErrIpAddressInvalid,
		27:    ErrFileExists,
		28:    ErrLocked,
		29:    ErrDeadlock,
		30:    ErrShuttingDown,
		400:   ErrHttpBadParameter,
		401:   ErrHttpUnauthorized,
		403:   ErrHttpForbidden,
		404:   ErrHttpNotFound,
		405:   ErrHttpMethodNotAllowed,
		412:   ErrHttpPreconditionFailed,
		500:   ErrHttpServerError,
		600:   ErrHttpCorruptedJson,
		601:   ErrHttpSuperfluousSuffices,
		1000:  ErrArangoIllegalState,
		1002:  ErrArangoDatafileSealed,
		1003:  ErrArangoUnknownCollectionType,
		1004:  ErrArangoReadOnly,
		1005:  ErrArangoDuplicateIdentifier,
		1006:  ErrArangoDatafileUnreadable,
		1007:  ErrArangoDatafileEmpty,
		1008:  ErrArangoRecovery,
		1100:  ErrArangoCorruptedDatafile,
		1101:  ErrArangoIllegalParameterFile,
		1102:  ErrArangoCorruptedCollection,
		1103:  ErrArangoMmapFailed,
		1104:  ErrArangoFilesystemFull,
		1105:  ErrArangoNoJournal,
		1106:  ErrArangoDatafileAlreadyExists,
		1107:  ErrArangoDatadirLocked,
		1108:  ErrArangoCollectionDirectoryAlreadyExists,
		1109:  ErrArangoMsyncFailed,
		1110:  ErrArangoDatadirUnlockable,
		1111:  ErrArangoSyncTimeout,
		1200:  ErrArangoConflict,
		1201:  ErrArangoDatadirInvalid,
		1202:  ErrArangoDocumentNotFound,
		1203:  ErrArangoCollectionNotFound,
		1204:  ErrArangoCollectionParameterMissing,
		1205:  ErrArangoDocumentHandleBad,
		1206:  ErrArangoMaximalSizeTooSmall,
		1207:  ErrArangoDuplicateName,
		1208:  ErrArangoIllegalName,
		1209:  ErrArangoNoIndex,
		1210:  ErrArangoUniqueConstraintViolated,
		1212:  ErrArangoIndexNotFound,
		1213:  ErrArangoCrossCollectionRequest,
		1214:  ErrArangoIndexHandleBad,
		1216:  ErrArangoDocumentTooLarge,
		1217:  ErrArangoCollectionNotUnloaded,
		1218:  ErrArangoCollectionTypeInvalid,
		1219:  ErrArangoValidationFailed,
		1220:  ErrArangoAttributeParserFailed,
		1221:  ErrArangoDocumentKeyBad,
		1222:  ErrArangoDocumentKeyUnexpected,
		1224:  ErrArangoDatadirNotWritable,
		1225:  ErrArangoOutOfKeys,
		1226:  ErrArangoDocumentKeyMissing,
		1227:  ErrArangoDocumentTypeInvalid,
		1228:  ErrArangoDatabaseNotFound,
		1229:  ErrArangoDatabaseNameInvalid,
		1230:  ErrArangoUseSystemDatabase,
		1231:  ErrArangoEndpointNotFound,
		1232:  ErrArangoInvalidKeyGenerator,
		1233:  ErrArangoInvalidEdgeAttribute,
		1234:  ErrArangoIndexDocumentAttributeMissing,
		1235:  ErrArangoIndexCreationFailed,
		1236:  ErrArangoWriteThrottleTimeout,
		1237:  ErrArangoCollectionTypeMismatch,
		1238:  ErrArangoCollectionNotLoaded,
		1239:  ErrArangoDocumentRevBad,
		1300:  ErrArangoDatafileFull,
		1301:  ErrArangoEmptyDatadir,
		1400:  ErrReplicationNoResponse,
		1401:  ErrReplicationInvalidResponse,
		1402:  ErrReplicationMasterError,
		1403:  ErrReplicationMasterIncompatible,
		1404:  ErrReplicationMasterChange,
		1405:  ErrReplicationLoop,
		1406:  ErrReplicationUnexpectedMarker,
		1407:  ErrReplicationInvalidApplierState,
		1408:  ErrReplicationUnexpectedTransaction,
		1410:  ErrReplicationInvalidApplierConfiguration,
		1411:  ErrReplicationRunning,
		1412:  ErrReplicationApplierStopped,
		1413:  ErrReplicationNoStartTick,
		1414:  ErrReplicationStartTickNotPresent,
		1450:  ErrClusterNoAgency,
		1451:  ErrClusterNoCoordinatorHeader,
		1452:  ErrClusterCouldNotLockPlan,
		1453:  ErrClusterCollectionIdExists,
		1454:  ErrClusterCouldNotCreateCollectionInPlan,
		1455:  ErrClusterCouldNotReadCurrentVersion,
		1456:  ErrClusterCouldNotCreateCollection,
		1457:  ErrClusterTimeout,
		1458:  ErrClusterCouldNotRemoveCollectionInPlan,
		1459:  ErrClusterCouldNotRemoveCollectionInCurrent,
		1460:  ErrClusterCouldNotCreateDatabaseInPlan,
		1461:  ErrClusterCouldNotCreateDatabase,
		1462:  ErrClusterCouldNotRemoveDatabaseInPlan,
		1463:  ErrClusterCouldNotRemoveDatabaseInCurrent,
		1464:  ErrClusterShardGone,
		1465:  ErrClusterConnectionLost,
		1466:  ErrClusterMustNotSpecifyKey,
		1467:  ErrClusterGotContradictingAnswers,
		1468:  ErrClusterNotAllShardingAttributesGiven,
		1469:  ErrClusterMustNotChangeShardingAttributes,
		1470:  ErrClusterUnsupported,
		1471:  ErrClusterOnlyOnCoordinator,
		1472:  ErrClusterReadingPlanAgency,
		1473:  ErrClusterCouldNotTruncateCollection,
		1474:  ErrClusterAqlCommunication,
		1475:  ErrArangoDocumentNotFoundOrShardingAttributesChanged,
		1476:  ErrClusterCouldNotDetermineId,
		1477:  ErrClusterOnlyOnDbserver,
		1478:  ErrClusterBackendUnavailable,
		1479:  ErrClusterUnknownCallbackEndpoint,
		1480:  ErrClusterAgencyStructureInvalid,
		1500:  ErrQueryKilled,
		1501:  ErrQueryParse,
		1502:  ErrQueryEmpty,
		1503:  ErrQueryScript,
		1504:  ErrQueryNumberOutOfRange,
		1510:  ErrQueryVariableNameInvalid,
		1511:  ErrQueryVariableRedeclared,
		1512:  ErrQueryVariableNameUnknown,
		1521:  ErrQueryCollectionLockFailed,
		1522:  ErrQueryTooManyCollections,
		1530:  ErrQueryDocumentAttributeRedeclared,
		1540:  ErrQueryFunctionNameUnknown,
		1541:  ErrQueryFunctionArgumentNumberMismatch,
		1542:  ErrQueryFunctionArgumentTypeMismatch,
		1543:  ErrQueryInvalidRegex,
		1550:  ErrQueryBindParametersInvalid,
		1551:  ErrQueryBindParameterMissing,
		1552:  ErrQueryBindParameterUndeclared,
		1553:  ErrQueryBindParameterType,
		1560:  ErrQueryInvalidLogicalValue,
		1561:  ErrQueryInvalidArithmeticValue,
		1562:  ErrQueryDivisionByZero,
		1563:  ErrQueryArrayExpected,
		1569:  ErrQueryFailCalled,
		1570:  ErrQueryGeoIndexMissing,
		1571:  ErrQueryFulltextIndexMissing,
		1572:  ErrQueryInvalidDateValue,
		1573:  ErrQueryMultiModify,
		1574:  ErrQueryInvalidAggregateExpression,
		1575:  ErrQueryCompileTimeOptions,
		1576:  ErrQueryExceptionOptions,
		1577:  ErrQueryCollectionUsedInExpression,
		1578:  ErrQueryDisallowedDynamicCall,
		1579:  ErrQueryAccessAfterModification,
		1580:  ErrQueryFunctionInvalidName,
		1581:  ErrQueryFunctionInvalidCode,
		1582:  ErrQueryFunctionNotFound,
		1583:  ErrQueryFunctionRuntimeError,
		1590:  ErrQueryBadJsonPlan,
		1591:  ErrQueryNotFound,
		1592:  ErrQueryInUse,
		1600:  ErrCursorNotFound,
		1601:  ErrCursorBusy,
		1650:  ErrTransactionInternal,
		1651:  ErrTransactionNested,
		1652:  ErrTransactionUnregisteredCollection,
		1653:  ErrTransactionDisallowedOperation,
		1654:  ErrTransactionAborted,
		1700:  ErrUserInvalidName,
		1701:  ErrUserInvalidPassword,
		1702:  ErrUserDuplicate,
		1703:  ErrUserNotFound,
		1704:  ErrUserChangePassword,
		1750:  ErrServiceInvalidName,
		1751:  ErrServiceInvalidMount,
		1752:  ErrServiceDownloadFailed,
		1753:  ErrServiceUploadFailed,
		1800:  ErrKeyvalueInvalidKey,
		1801:  ErrKeyvalueKeyExists,
		1802:  ErrKeyvalueKeyNotFound,
		1803:  ErrKeyvalueKeyNotUnique,
		1804:  ErrKeyvalueKeyNotChanged,
		1805:  ErrKeyvalueKeyNotRemoved,
		1806:  ErrKeyvalueNoValue,
		1850:  ErrTaskInvalidId,
		1851:  ErrTaskDuplicateId,
		1852:  ErrTaskNotFound,
		1901:  ErrGraphInvalidGraph,
		1902:  ErrGraphCouldNotCreateGraph,
		1903:  ErrGraphInvalidVertex,
		1904:  ErrGraphCouldNotCreateVertex,
		1905:  ErrGraphCouldNotChangeVertex,
		1906:  ErrGraphInvalidEdge,
		1907:  ErrGraphCouldNotCreateEdge,
		1908:  ErrGraphCouldNotChangeEdge,
		1909:  ErrGraphTooManyIterations,
		1910:  ErrGraphInvalidFilterResult,
		1920:  ErrGraphCollectionMultiUse,
		1921:  ErrGraphCollectionUseInMultiGraphs,
		1922:  ErrGraphCreateMissingName,
		1923:  ErrGraphCreateMalformedEdgeDefinition,
		1924:  ErrGraphNotFound,
		1925:  ErrGraphDuplicate,
		1926:  ErrGraphVertexColDoesNotExist,
		1927:  ErrGraphWrongCollectionTypeVertex,
		1928:  ErrGraphNotInOrphanCollection,
		1929:  ErrGraphCollectionUsedInEdgeDef,
		1930:  ErrGraphEdgeCollectionNotUsed,
		1931:  ErrGraphNotAnArangoCollection,
		1932:  ErrGraphNoGraphCollection,
		1933:  ErrGraphInvalidExampleArrayObjectString,
		1934:  ErrGraphInvalidExampleArrayObject,
		1935:  ErrGraphInvalidNumberOfArguments,
		1936:  ErrGraphInvalidParameter,
		1937:  ErrGraphInvalidId,
		1938:  ErrGraphCollectionUsedInOrphans,
		1939:  ErrGraphEdgeColDoesNotExist,
		1940:  ErrGraphEmpty,
		1950:  ErrSessionUnknown,
		1951:  ErrSessionExpired,
		2000:  ErrSimpleClientUnknownError,
		2001:  ErrSimpleClientCouldNotConnect,
		2002:  ErrSimpleClientCouldNotWrite,
		2003:  ErrSimpleClientCouldNotRead,
		3000:  ErrMalformedManifestFile,
		3001:  ErrInvalidServiceManifest,
		3004:  ErrInvalidFoxxOptions,
		3007:  ErrInvalidMountpoint,
		3009:  ErrServiceNotFound,
		3010:  ErrServiceNeedsConfiguration,
		3011:  ErrServiceMountpointConflict,
		3100:  ErrModuleNotFound,
		3103:  ErrModuleFailure,
		10000: ErrResultElementExists,
		10001: ErrResultElementNotFound,
		21000: ErrQueueAlreadyExists,
		21001: ErrDispatcherIsStopping,
		21002: ErrQueueUnknown,
		21003: ErrQueueFull,
	}
)
