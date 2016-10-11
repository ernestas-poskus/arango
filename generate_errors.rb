require 'nokogiri'

frag = <<-eos
<ul>
<li><p><a name="ERROR_NO_ERROR"></a><strong>0</strong> - <strong>ERROR_NO_ERROR</strong><br>
No error has occurred.</p>
</li>
<li><p><a name="ERROR_FAILED"></a><strong>1</strong> - <strong>ERROR_FAILED</strong><br>
Will be raised when a general error occurred.</p>
</li>
<li><p><a name="ERROR_SYS_ERROR"></a><strong>2</strong> - <strong>ERROR_SYS_ERROR</strong><br>
Will be raised when operating system error occurred.</p>
</li>
<li><p><a name="ERROR_OUT_OF_MEMORY"></a><strong>3</strong> - <strong>ERROR_OUT_OF_MEMORY</strong><br>
Will be raised when there is a memory shortage.</p>
</li>
<li><p><a name="ERROR_INTERNAL"></a><strong>4</strong> - <strong>ERROR_INTERNAL</strong><br>
Will be raised when an internal error occurred.</p>
</li>
<li><p><a name="ERROR_ILLEGAL_NUMBER"></a><strong>5</strong> - <strong>ERROR_ILLEGAL_NUMBER</strong><br>
Will be raised when an illegal representation of a number was given.</p>
</li>
<li><p><a name="ERROR_NUMERIC_OVERFLOW"></a><strong>6</strong> - <strong>ERROR_NUMERIC_OVERFLOW</strong><br>
Will be raised when a numeric overflow occurred.</p>
</li>
<li><p><a name="ERROR_ILLEGAL_OPTION"></a><strong>7</strong> - <strong>ERROR_ILLEGAL_OPTION</strong><br>
Will be raised when an unknown option was supplied by the user.</p>
</li>
<li><p><a name="ERROR_DEAD_PID"></a><strong>8</strong> - <strong>ERROR_DEAD_PID</strong><br>
Will be raised when a PID without a living process was found.</p>
</li>
<li><p><a name="ERROR_NOT_IMPLEMENTED"></a><strong>9</strong> - <strong>ERROR_NOT_IMPLEMENTED</strong><br>
Will be raised when hitting an unimplemented feature.</p>
</li>
<li><p><a name="ERROR_BAD_PARAMETER"></a><strong>10</strong> - <strong>ERROR_BAD_PARAMETER</strong><br>
Will be raised when the parameter does not fulfill the requirements.</p>
</li>
<li><p><a name="ERROR_FORBIDDEN"></a><strong>11</strong> - <strong>ERROR_FORBIDDEN</strong><br>
Will be raised when you are missing permission for the operation.</p>
</li>
<li><p><a name="ERROR_OUT_OF_MEMORY_MMAP"></a><strong>12</strong> - <strong>ERROR_OUT_OF_MEMORY_MMAP</strong><br>
Will be raised when there is a memory shortage.</p>
</li>
<li><p><a name="ERROR_CORRUPTED_CSV"></a><strong>13</strong> - <strong>ERROR_CORRUPTED_CSV</strong><br>
Will be raised when encountering a corrupt csv line.</p>
</li>
<li><p><a name="ERROR_FILE_NOT_FOUND"></a><strong>14</strong> - <strong>ERROR_FILE_NOT_FOUND</strong><br>
Will be raised when a file is not found.</p>
</li>
<li><p><a name="ERROR_CANNOT_WRITE_FILE"></a><strong>15</strong> - <strong>ERROR_CANNOT_WRITE_FILE</strong><br>
Will be raised when a file cannot be written.</p>
</li>
<li><p><a name="ERROR_CANNOT_OVERWRITE_FILE"></a><strong>16</strong> - <strong>ERROR_CANNOT_OVERWRITE_FILE</strong><br>
Will be raised when an attempt is made to overwrite an existing file.</p>
</li>
<li><p><a name="ERROR_TYPE_ERROR"></a><strong>17</strong> - <strong>ERROR_TYPE_ERROR</strong><br>
Will be raised when a type error is unencountered.</p>
</li>
<li><p><a name="ERROR_LOCK_TIMEOUT"></a><strong>18</strong> - <strong>ERROR_LOCK_TIMEOUT</strong><br>
Will be raised when there&apos;s a timeout waiting for a lock.</p>
</li>
<li><p><a name="ERROR_CANNOT_CREATE_DIRECTORY"></a><strong>19</strong> - <strong>ERROR_CANNOT_CREATE_DIRECTORY</strong><br>
Will be raised when an attempt to create a directory fails.</p>
</li>
<li><p><a name="ERROR_CANNOT_CREATE_TEMP_FILE"></a><strong>20</strong> - <strong>ERROR_CANNOT_CREATE_TEMP_FILE</strong><br>
Will be raised when an attempt to create a temporary file fails.</p>
</li>
<li><p><a name="ERROR_REQUEST_CANCELED"></a><strong>21</strong> - <strong>ERROR_REQUEST_CANCELED</strong><br>
Will be raised when a request is canceled by the user.</p>
</li>
<li><p><a name="ERROR_DEBUG"></a><strong>22</strong> - <strong>ERROR_DEBUG</strong><br>
Will be raised intentionally during debugging.</p>
</li>
<li><p><a name="ERROR_IP_ADDRESS_INVALID"></a><strong>25</strong> - <strong>ERROR_IP_ADDRESS_INVALID</strong><br>
Will be raised when the structure of an IP address is invalid.</p>
</li>
<li><p><a name="ERROR_FILE_EXISTS"></a><strong>27</strong> - <strong>ERROR_FILE_EXISTS</strong><br>
Will be raised when a file already exists.</p>
</li>
<li><p><a name="ERROR_LOCKED"></a><strong>28</strong> - <strong>ERROR_LOCKED</strong><br>
Will be raised when a resource or an operation is locked.</p>
</li>
<li><p><a name="ERROR_DEADLOCK"></a><strong>29</strong> - <strong>ERROR_DEADLOCK</strong><br>
Will be raised when a deadlock is detected when accessing collections.</p>
</li>
<li><p><a name="ERROR_SHUTTING_DOWN"></a><strong>30</strong> - <strong>ERROR_SHUTTING_DOWN</strong><br>
Will be raised when a call cannot succeed because a server shutdown is already in progress.</p>
</li>
</ul>
<h2 id="http-error-status-codes">HTTP error status codes</h2>
<ul>
<li><p><a name="ERROR_HTTP_BAD_PARAMETER"></a><strong>400</strong> - <strong>ERROR_HTTP_BAD_PARAMETER</strong><br>
Will be raised when the HTTP request does not fulfill the requirements.</p>
</li>
<li><p><a name="ERROR_HTTP_UNAUTHORIZED"></a><strong>401</strong> - <strong>ERROR_HTTP_UNAUTHORIZED</strong><br>
Will be raised when authorization is required but the user is not authorized.</p>
</li>
<li><p><a name="ERROR_HTTP_FORBIDDEN"></a><strong>403</strong> - <strong>ERROR_HTTP_FORBIDDEN</strong><br>
Will be raised when the operation is forbidden.</p>
</li>
<li><p><a name="ERROR_HTTP_NOT_FOUND"></a><strong>404</strong> - <strong>ERROR_HTTP_NOT_FOUND</strong><br>
Will be raised when an URI is unknown.</p>
</li>
<li><p><a name="ERROR_HTTP_METHOD_NOT_ALLOWED"></a><strong>405</strong> - <strong>ERROR_HTTP_METHOD_NOT_ALLOWED</strong><br>
Will be raised when an unsupported HTTP method is used for an operation.</p>
</li>
<li><p><a name="ERROR_HTTP_PRECONDITION_FAILED"></a><strong>412</strong> - <strong>ERROR_HTTP_PRECONDITION_FAILED</strong><br>
Will be raised when a precondition for an HTTP request is not met.</p>
</li>
<li><p><a name="ERROR_HTTP_SERVER_ERROR"></a><strong>500</strong> - <strong>ERROR_HTTP_SERVER_ERROR</strong><br>
Will be raised when an internal server is encountered.</p>
</li>
</ul>
<h2 id="http-processing-errors">HTTP processing errors</h2>
<ul>
<li><p><a name="ERROR_HTTP_CORRUPTED_JSON"></a><strong>600</strong> - <strong>ERROR_HTTP_CORRUPTED_JSON</strong><br>
Will be raised when a string representation of a JSON object is corrupt.</p>
</li>
<li><p><a name="ERROR_HTTP_SUPERFLUOUS_SUFFICES"></a><strong>601</strong> - <strong>ERROR_HTTP_SUPERFLUOUS_SUFFICES</strong><br>
Will be raised when the URL contains superfluous suffices.</p>
</li>
</ul>
<h2 id="internal-arangodb-storage-errors">Internal ArangoDB storage errors</h2>
<p>For errors that occur because of a programming error.</p>
<ul>
<li><p><a name="ERROR_ARANGO_ILLEGAL_STATE"></a><strong>1000</strong> - <strong>ERROR_ARANGO_ILLEGAL_STATE</strong><br>
Internal error that will be raised when the datafile is not in the required state.</p>
</li>
<li><p><a name="ERROR_ARANGO_DATAFILE_SEALED"></a><strong>1002</strong> - <strong>ERROR_ARANGO_DATAFILE_SEALED</strong><br>
Internal error that will be raised when trying to write to a datafile.</p>
</li>
<li><p><a name="ERROR_ARANGO_UNKNOWN_COLLECTION_TYPE"></a><strong>1003</strong> - <strong>ERROR_ARANGO_UNKNOWN_COLLECTION_TYPE</strong><br>
Internal error that will be raised when an unknown collection type is encountered.</p>
</li>
<li><p><a name="ERROR_ARANGO_READ_ONLY"></a><strong>1004</strong> - <strong>ERROR_ARANGO_READ_ONLY</strong><br>
Internal error that will be raised when trying to write to a read-only datafile or collection.</p>
</li>
<li><p><a name="ERROR_ARANGO_DUPLICATE_IDENTIFIER"></a><strong>1005</strong> - <strong>ERROR_ARANGO_DUPLICATE_IDENTIFIER</strong><br>
Internal error that will be raised when a identifier duplicate is detected.</p>
</li>
<li><p><a name="ERROR_ARANGO_DATAFILE_UNREADABLE"></a><strong>1006</strong> - <strong>ERROR_ARANGO_DATAFILE_UNREADABLE</strong><br>
Internal error that will be raised when a datafile is unreadable.</p>
</li>
<li><p><a name="ERROR_ARANGO_DATAFILE_EMPTY"></a><strong>1007</strong> - <strong>ERROR_ARANGO_DATAFILE_EMPTY</strong><br>
Internal error that will be raised when a datafile is empty.</p>
</li>
<li><p><a name="ERROR_ARANGO_RECOVERY"></a><strong>1008</strong> - <strong>ERROR_ARANGO_RECOVERY</strong><br>
Will be raised when an error occurred during WAL log file recovery.</p>
</li>
</ul>
<h2 id="external-arangodb-storage-errors">External ArangoDB storage errors</h2>
<p>For errors that occur because of an outside event.</p>
<ul>
<li><p><a name="ERROR_ARANGO_CORRUPTED_DATAFILE"></a><strong>1100</strong> - <strong>ERROR_ARANGO_CORRUPTED_DATAFILE</strong><br>
Will be raised when a corruption is detected in a datafile.</p>
</li>
<li><p><a name="ERROR_ARANGO_ILLEGAL_PARAMETER_FILE"></a><strong>1101</strong> - <strong>ERROR_ARANGO_ILLEGAL_PARAMETER_FILE</strong><br>
Will be raised if a parameter file is corrupted or cannot be read.</p>
</li>
<li><p><a name="ERROR_ARANGO_CORRUPTED_COLLECTION"></a><strong>1102</strong> - <strong>ERROR_ARANGO_CORRUPTED_COLLECTION</strong><br>
Will be raised when a collection contains one or more corrupted data files.</p>
</li>
<li><p><a name="ERROR_ARANGO_MMAP_FAILED"></a><strong>1103</strong> - <strong>ERROR_ARANGO_MMAP_FAILED</strong><br>
Will be raised when the system call mmap failed.</p>
</li>
<li><p><a name="ERROR_ARANGO_FILESYSTEM_FULL"></a><strong>1104</strong> - <strong>ERROR_ARANGO_FILESYSTEM_FULL</strong><br>
Will be raised when the filesystem is full.</p>
</li>
<li><p><a name="ERROR_ARANGO_NO_JOURNAL"></a><strong>1105</strong> - <strong>ERROR_ARANGO_NO_JOURNAL</strong><br>
Will be raised when a journal cannot be created.</p>
</li>
<li><p><a name="ERROR_ARANGO_DATAFILE_ALREADY_EXISTS"></a><strong>1106</strong> - <strong>ERROR_ARANGO_DATAFILE_ALREADY_EXISTS</strong><br>
Will be raised when the datafile cannot be created or renamed because a file of the same name already exists.</p>
</li>
<li><p><a name="ERROR_ARANGO_DATADIR_LOCKED"></a><strong>1107</strong> - <strong>ERROR_ARANGO_DATADIR_LOCKED</strong><br>
Will be raised when the database directory is locked by a different process.</p>
</li>
<li><p><a name="ERROR_ARANGO_COLLECTION_DIRECTORY_ALREADY_EXISTS"></a><strong>1108</strong> - <strong>ERROR_ARANGO_COLLECTION_DIRECTORY_ALREADY_EXISTS</strong><br>
Will be raised when the collection cannot be created because a directory of the same name already exists.</p>
</li>
<li><p><a name="ERROR_ARANGO_MSYNC_FAILED"></a><strong>1109</strong> - <strong>ERROR_ARANGO_MSYNC_FAILED</strong><br>
Will be raised when the system call msync failed.</p>
</li>
<li><p><a name="ERROR_ARANGO_DATADIR_UNLOCKABLE"></a><strong>1110</strong> - <strong>ERROR_ARANGO_DATADIR_UNLOCKABLE</strong><br>
Will be raised when the server cannot lock the database directory on startup.</p>
</li>
<li><p><a name="ERROR_ARANGO_SYNC_TIMEOUT"></a><strong>1111</strong> - <strong>ERROR_ARANGO_SYNC_TIMEOUT</strong><br>
Will be raised when the server waited too long for a datafile to be synced to disk.</p>
</li>
</ul>
<h2 id="general-arangodb-storage-errors">General ArangoDB storage errors</h2>
<p>For errors that occur when fulfilling a user request.</p>
<ul>
<li><p><a name="ERROR_ARANGO_CONFLICT"></a><strong>1200</strong> - <strong>ERROR_ARANGO_CONFLICT</strong><br>
Will be raised when updating or deleting a document and a conflict has been detected.</p>
</li>
<li><p><a name="ERROR_ARANGO_DATADIR_INVALID"></a><strong>1201</strong> - <strong>ERROR_ARANGO_DATADIR_INVALID</strong><br>
Will be raised when a non-existing database directory was specified when starting the database.</p>
</li>
<li><p><a name="ERROR_ARANGO_DOCUMENT_NOT_FOUND"></a><strong>1202</strong> - <strong>ERROR_ARANGO_DOCUMENT_NOT_FOUND</strong><br>
Will be raised when a document with a given identifier or handle is unknown.</p>
</li>
<li><p><a name="ERROR_ARANGO_COLLECTION_NOT_FOUND"></a><strong>1203</strong> - <strong>ERROR_ARANGO_COLLECTION_NOT_FOUND</strong><br>
Will be raised when a collection with a given identifier or name is unknown.</p>
</li>
<li><p><a name="ERROR_ARANGO_COLLECTION_PARAMETER_MISSING"></a><strong>1204</strong> - <strong>ERROR_ARANGO_COLLECTION_PARAMETER_MISSING</strong><br>
Will be raised when the collection parameter is missing.</p>
</li>
<li><p><a name="ERROR_ARANGO_DOCUMENT_HANDLE_BAD"></a><strong>1205</strong> - <strong>ERROR_ARANGO_DOCUMENT_HANDLE_BAD</strong><br>
Will be raised when a document handle is corrupt.</p>
</li>
<li><p><a name="ERROR_ARANGO_MAXIMAL_SIZE_TOO_SMALL"></a><strong>1206</strong> - <strong>ERROR_ARANGO_MAXIMAL_SIZE_TOO_SMALL</strong><br>
Will be raised when the maximal size of the journal is too small.</p>
</li>
<li><p><a name="ERROR_ARANGO_DUPLICATE_NAME"></a><strong>1207</strong> - <strong>ERROR_ARANGO_DUPLICATE_NAME</strong><br>
Will be raised when a name duplicate is detected.</p>
</li>
<li><p><a name="ERROR_ARANGO_ILLEGAL_NAME"></a><strong>1208</strong> - <strong>ERROR_ARANGO_ILLEGAL_NAME</strong><br>
Will be raised when an illegal name is detected.</p>
</li>
<li><p><a name="ERROR_ARANGO_NO_INDEX"></a><strong>1209</strong> - <strong>ERROR_ARANGO_NO_INDEX</strong><br>
Will be raised when no suitable index for the query is known.</p>
</li>
<li><p><a name="ERROR_ARANGO_UNIQUE_CONSTRAINT_VIOLATED"></a><strong>1210</strong> - <strong>ERROR_ARANGO_UNIQUE_CONSTRAINT_VIOLATED</strong><br>
Will be raised when there is a unique constraint violation.</p>
</li>
<li><p><a name="ERROR_ARANGO_INDEX_NOT_FOUND"></a><strong>1212</strong> - <strong>ERROR_ARANGO_INDEX_NOT_FOUND</strong><br>
Will be raised when an index with a given identifier is unknown.</p>
</li>
<li><p><a name="ERROR_ARANGO_CROSS_COLLECTION_REQUEST"></a><strong>1213</strong> - <strong>ERROR_ARANGO_CROSS_COLLECTION_REQUEST</strong><br>
Will be raised when a cross-collection is requested.</p>
</li>
<li><p><a name="ERROR_ARANGO_INDEX_HANDLE_BAD"></a><strong>1214</strong> - <strong>ERROR_ARANGO_INDEX_HANDLE_BAD</strong><br>
Will be raised when a index handle is corrupt.</p>
</li>
<li><p><a name="ERROR_ARANGO_DOCUMENT_TOO_LARGE"></a><strong>1216</strong> - <strong>ERROR_ARANGO_DOCUMENT_TOO_LARGE</strong><br>
Will be raised when the document cannot fit into any datafile because of it is too large.</p>
</li>
<li><p><a name="ERROR_ARANGO_COLLECTION_NOT_UNLOADED"></a><strong>1217</strong> - <strong>ERROR_ARANGO_COLLECTION_NOT_UNLOADED</strong><br>
Will be raised when a collection should be unloaded, but has a different status.</p>
</li>
<li><p><a name="ERROR_ARANGO_COLLECTION_TYPE_INVALID"></a><strong>1218</strong> - <strong>ERROR_ARANGO_COLLECTION_TYPE_INVALID</strong><br>
Will be raised when an invalid collection type is used in a request.</p>
</li>
<li><p><a name="ERROR_ARANGO_VALIDATION_FAILED"></a><strong>1219</strong> - <strong>ERROR_ARANGO_VALIDATION_FAILED</strong><br>
Will be raised when the validation of an attribute of a structure failed.</p>
</li>
<li><p><a name="ERROR_ARANGO_ATTRIBUTE_PARSER_FAILED"></a><strong>1220</strong> - <strong>ERROR_ARANGO_ATTRIBUTE_PARSER_FAILED</strong><br>
Will be raised when parsing an attribute name definition failed.</p>
</li>
<li><p><a name="ERROR_ARANGO_DOCUMENT_KEY_BAD"></a><strong>1221</strong> - <strong>ERROR_ARANGO_DOCUMENT_KEY_BAD</strong><br>
Will be raised when a document key is corrupt.</p>
</li>
<li><p><a name="ERROR_ARANGO_DOCUMENT_KEY_UNEXPECTED"></a><strong>1222</strong> - <strong>ERROR_ARANGO_DOCUMENT_KEY_UNEXPECTED</strong><br>
Will be raised when a user-defined document key is supplied for collections with auto key generation.</p>
</li>
<li><p><a name="ERROR_ARANGO_DATADIR_NOT_WRITABLE"></a><strong>1224</strong> - <strong>ERROR_ARANGO_DATADIR_NOT_WRITABLE</strong><br>
Will be raised when the server&apos;s database directory is not writable for the current user.</p>
</li>
<li><p><a name="ERROR_ARANGO_OUT_OF_KEYS"></a><strong>1225</strong> - <strong>ERROR_ARANGO_OUT_OF_KEYS</strong><br>
Will be raised when a key generator runs out of keys.</p>
</li>
<li><p><a name="ERROR_ARANGO_DOCUMENT_KEY_MISSING"></a><strong>1226</strong> - <strong>ERROR_ARANGO_DOCUMENT_KEY_MISSING</strong><br>
Will be raised when a document key is missing.</p>
</li>
<li><p><a name="ERROR_ARANGO_DOCUMENT_TYPE_INVALID"></a><strong>1227</strong> - <strong>ERROR_ARANGO_DOCUMENT_TYPE_INVALID</strong><br>
Will be raised when there is an attempt to create a document with an invalid type.</p>
</li>
<li><p><a name="ERROR_ARANGO_DATABASE_NOT_FOUND"></a><strong>1228</strong> - <strong>ERROR_ARANGO_DATABASE_NOT_FOUND</strong><br>
Will be raised when a non-existing database is accessed.</p>
</li>
<li><p><a name="ERROR_ARANGO_DATABASE_NAME_INVALID"></a><strong>1229</strong> - <strong>ERROR_ARANGO_DATABASE_NAME_INVALID</strong><br>
Will be raised when an invalid database name is used.</p>
</li>
<li><p><a name="ERROR_ARANGO_USE_SYSTEM_DATABASE"></a><strong>1230</strong> - <strong>ERROR_ARANGO_USE_SYSTEM_DATABASE</strong><br>
Will be raised when an operation is requested in a database other than the system database.</p>
</li>
<li><p><a name="ERROR_ARANGO_ENDPOINT_NOT_FOUND"></a><strong>1231</strong> - <strong>ERROR_ARANGO_ENDPOINT_NOT_FOUND</strong><br>
Will be raised when there is an attempt to delete a non-existing endpoint.</p>
</li>
<li><p><a name="ERROR_ARANGO_INVALID_KEY_GENERATOR"></a><strong>1232</strong> - <strong>ERROR_ARANGO_INVALID_KEY_GENERATOR</strong><br>
Will be raised when an invalid key generator description is used.</p>
</li>
<li><p><a name="ERROR_ARANGO_INVALID_EDGE_ATTRIBUTE"></a><strong>1233</strong> - <strong>ERROR_ARANGO_INVALID_EDGE_ATTRIBUTE</strong><br>
will be raised when the _from or _to values of an edge are undefined or contain an invalid value.</p>
</li>
<li><p><a name="ERROR_ARANGO_INDEX_DOCUMENT_ATTRIBUTE_MISSING"></a><strong>1234</strong> - <strong>ERROR_ARANGO_INDEX_DOCUMENT_ATTRIBUTE_MISSING</strong><br>
Will be raised when an attempt to insert a document into an index is caused by in the document not having one or more attributes which the index is built on.</p>
</li>
<li><p><a name="ERROR_ARANGO_INDEX_CREATION_FAILED"></a><strong>1235</strong> - <strong>ERROR_ARANGO_INDEX_CREATION_FAILED</strong><br>
Will be raised when an attempt to create an index has failed.</p>
</li>
<li><p><a name="ERROR_ARANGO_WRITE_THROTTLE_TIMEOUT"></a><strong>1236</strong> - <strong>ERROR_ARANGO_WRITE_THROTTLE_TIMEOUT</strong><br>
Will be raised when the server is write-throttled and a write operation has waited too long for the server to process queued operations.</p>
</li>
<li><p><a name="ERROR_ARANGO_COLLECTION_TYPE_MISMATCH"></a><strong>1237</strong> - <strong>ERROR_ARANGO_COLLECTION_TYPE_MISMATCH</strong><br>
Will be raised when a collection has a different type from what has been expected.</p>
</li>
<li><p><a name="ERROR_ARANGO_COLLECTION_NOT_LOADED"></a><strong>1238</strong> - <strong>ERROR_ARANGO_COLLECTION_NOT_LOADED</strong><br>
Will be raised when a collection is accessed that is not yet loaded.</p>
</li>
<li><p><a name="ERROR_ARANGO_DOCUMENT_REV_BAD"></a><strong>1239</strong> - <strong>ERROR_ARANGO_DOCUMENT_REV_BAD</strong><br>
Will be raised when a document revision is corrupt or is missing where needed.</p>
</li>
</ul>
<h2 id="checked-arangodb-storage-errors">Checked ArangoDB storage errors</h2>
<p>For errors that occur but are anticipated.</p>
<ul>
<li><p><a name="ERROR_ARANGO_DATAFILE_FULL"></a><strong>1300</strong> - <strong>ERROR_ARANGO_DATAFILE_FULL</strong><br>
Will be raised when the datafile reaches its limit.</p>
</li>
<li><p><a name="ERROR_ARANGO_EMPTY_DATADIR"></a><strong>1301</strong> - <strong>ERROR_ARANGO_EMPTY_DATADIR</strong><br>
Will be raised when encountering an empty server database directory.</p>
</li>
</ul>
<h2 id="arangodb-replication-errors">ArangoDB replication errors</h2>
<ul>
<li><p><a name="ERROR_REPLICATION_NO_RESPONSE"></a><strong>1400</strong> - <strong>ERROR_REPLICATION_NO_RESPONSE</strong><br>
Will be raised when the replication applier does not receive any or an incomplete response from the master.</p>
</li>
<li><p><a name="ERROR_REPLICATION_INVALID_RESPONSE"></a><strong>1401</strong> - <strong>ERROR_REPLICATION_INVALID_RESPONSE</strong><br>
Will be raised when the replication applier receives an invalid response from the master.</p>
</li>
<li><p><a name="ERROR_REPLICATION_MASTER_ERROR"></a><strong>1402</strong> - <strong>ERROR_REPLICATION_MASTER_ERROR</strong><br>
Will be raised when the replication applier receives a server error from the master.</p>
</li>
<li><p><a name="ERROR_REPLICATION_MASTER_INCOMPATIBLE"></a><strong>1403</strong> - <strong>ERROR_REPLICATION_MASTER_INCOMPATIBLE</strong><br>
Will be raised when the replication applier connects to a master that has an incompatible version.</p>
</li>
<li><p><a name="ERROR_REPLICATION_MASTER_CHANGE"></a><strong>1404</strong> - <strong>ERROR_REPLICATION_MASTER_CHANGE</strong><br>
Will be raised when the replication applier connects to a different master than before.</p>
</li>
<li><p><a name="ERROR_REPLICATION_LOOP"></a><strong>1405</strong> - <strong>ERROR_REPLICATION_LOOP</strong><br>
Will be raised when the replication applier is asked to connect to itself for replication.</p>
</li>
<li><p><a name="ERROR_REPLICATION_UNEXPECTED_MARKER"></a><strong>1406</strong> - <strong>ERROR_REPLICATION_UNEXPECTED_MARKER</strong><br>
Will be raised when an unexpected marker is found in the replication log stream.</p>
</li>
<li><p><a name="ERROR_REPLICATION_INVALID_APPLIER_STATE"></a><strong>1407</strong> - <strong>ERROR_REPLICATION_INVALID_APPLIER_STATE</strong><br>
Will be raised when an invalid replication applier state file is found.</p>
</li>
<li><p><a name="ERROR_REPLICATION_UNEXPECTED_TRANSACTION"></a><strong>1408</strong> - <strong>ERROR_REPLICATION_UNEXPECTED_TRANSACTION</strong><br>
Will be raised when an unexpected transaction id is found.</p>
</li>
<li><p><a name="ERROR_REPLICATION_INVALID_APPLIER_CONFIGURATION"></a><strong>1410</strong> - <strong>ERROR_REPLICATION_INVALID_APPLIER_CONFIGURATION</strong><br>
Will be raised when the configuration for the replication applier is invalid.</p>
</li>
<li><p><a name="ERROR_REPLICATION_RUNNING"></a><strong>1411</strong> - <strong>ERROR_REPLICATION_RUNNING</strong><br>
Will be raised when there is an attempt to perform an operation while the replication applier is running.</p>
</li>
<li><p><a name="ERROR_REPLICATION_APPLIER_STOPPED"></a><strong>1412</strong> - <strong>ERROR_REPLICATION_APPLIER_STOPPED</strong><br>
Special error code used to indicate the replication applier was stopped by a user.</p>
</li>
<li><p><a name="ERROR_REPLICATION_NO_START_TICK"></a><strong>1413</strong> - <strong>ERROR_REPLICATION_NO_START_TICK</strong><br>
Will be raised when the replication applier is started without a known start tick value.</p>
</li>
<li><p><a name="ERROR_REPLICATION_START_TICK_NOT_PRESENT"></a><strong>1414</strong> - <strong>ERROR_REPLICATION_START_TICK_NOT_PRESENT</strong><br>
Will be raised when the replication applier fetches data using a start tick, but that start tick is not present on the logger server anymore.</p>
</li>
</ul>
<h2 id="arangodb-cluster-errors">ArangoDB cluster errors</h2>
<ul>
<li><p><a name="ERROR_CLUSTER_NO_AGENCY"></a><strong>1450</strong> - <strong>ERROR_CLUSTER_NO_AGENCY</strong><br>
Will be raised when none of the agency servers can be connected to.</p>
</li>
<li><p><a name="ERROR_CLUSTER_NO_COORDINATOR_HEADER"></a><strong>1451</strong> - <strong>ERROR_CLUSTER_NO_COORDINATOR_HEADER</strong><br>
Will be raised when a DB server in a cluster receives a HTTP request without a coordinator header.</p>
</li>
<li><p><a name="ERROR_CLUSTER_COULD_NOT_LOCK_PLAN"></a><strong>1452</strong> - <strong>ERROR_CLUSTER_COULD_NOT_LOCK_PLAN</strong><br>
Will be raised when a coordinator in a cluster cannot lock the Plan hierarchy in the agency.</p>
</li>
<li><p><a name="ERROR_CLUSTER_COLLECTION_ID_EXISTS"></a><strong>1453</strong> - <strong>ERROR_CLUSTER_COLLECTION_ID_EXISTS</strong><br>
Will be raised when a coordinator in a cluster tries to create a collection and the collection ID already exists.</p>
</li>
<li><p><a name="ERROR_CLUSTER_COULD_NOT_CREATE_COLLECTION_IN_PLAN"></a><strong>1454</strong> - <strong>ERROR_CLUSTER_COULD_NOT_CREATE_COLLECTION_IN_PLAN</strong><br>
Will be raised when a coordinator in a cluster cannot create an entry for a new collection in the Plan hierarchy in the agency.</p>
</li>
<li><p><a name="ERROR_CLUSTER_COULD_NOT_READ_CURRENT_VERSION"></a><strong>1455</strong> - <strong>ERROR_CLUSTER_COULD_NOT_READ_CURRENT_VERSION</strong><br>
Will be raised when a coordinator in a cluster cannot read the Version entry in the Current hierarchy in the agency.</p>
</li>
<li><p><a name="ERROR_CLUSTER_COULD_NOT_CREATE_COLLECTION"></a><strong>1456</strong> - <strong>ERROR_CLUSTER_COULD_NOT_CREATE_COLLECTION</strong><br>
Will be raised when a coordinator in a cluster notices that some DBServers report problems when creating shards for a new collection.</p>
</li>
<li><p><a name="ERROR_CLUSTER_TIMEOUT"></a><strong>1457</strong> - <strong>ERROR_CLUSTER_TIMEOUT</strong><br>
Will be raised when a coordinator in a cluster runs into a timeout for some cluster wide operation.</p>
</li>
<li><p><a name="ERROR_CLUSTER_COULD_NOT_REMOVE_COLLECTION_IN_PLAN"></a><strong>1458</strong> - <strong>ERROR_CLUSTER_COULD_NOT_REMOVE_COLLECTION_IN_PLAN</strong><br>
Will be raised when a coordinator in a cluster cannot remove an entry for a collection in the Plan hierarchy in the agency.</p>
</li>
<li><p><a name="ERROR_CLUSTER_COULD_NOT_REMOVE_COLLECTION_IN_CURRENT"></a><strong>1459</strong> - <strong>ERROR_CLUSTER_COULD_NOT_REMOVE_COLLECTION_IN_CURRENT</strong><br>
Will be raised when a coordinator in a cluster cannot remove an entry for a collection in the Current hierarchy in the agency.</p>
</li>
<li><p><a name="ERROR_CLUSTER_COULD_NOT_CREATE_DATABASE_IN_PLAN"></a><strong>1460</strong> - <strong>ERROR_CLUSTER_COULD_NOT_CREATE_DATABASE_IN_PLAN</strong><br>
Will be raised when a coordinator in a cluster cannot create an entry for a new database in the Plan hierarchy in the agency.</p>
</li>
<li><p><a name="ERROR_CLUSTER_COULD_NOT_CREATE_DATABASE"></a><strong>1461</strong> - <strong>ERROR_CLUSTER_COULD_NOT_CREATE_DATABASE</strong><br>
Will be raised when a coordinator in a cluster notices that some DBServers report problems when creating databases for a new cluster wide database.</p>
</li>
<li><p><a name="ERROR_CLUSTER_COULD_NOT_REMOVE_DATABASE_IN_PLAN"></a><strong>1462</strong> - <strong>ERROR_CLUSTER_COULD_NOT_REMOVE_DATABASE_IN_PLAN</strong><br>
Will be raised when a coordinator in a cluster cannot remove an entry for a database in the Plan hierarchy in the agency.</p>
</li>
<li><p><a name="ERROR_CLUSTER_COULD_NOT_REMOVE_DATABASE_IN_CURRENT"></a><strong>1463</strong> - <strong>ERROR_CLUSTER_COULD_NOT_REMOVE_DATABASE_IN_CURRENT</strong><br>
Will be raised when a coordinator in a cluster cannot remove an entry for a database in the Current hierarchy in the agency.</p>
</li>
<li><p><a name="ERROR_CLUSTER_SHARD_GONE"></a><strong>1464</strong> - <strong>ERROR_CLUSTER_SHARD_GONE</strong><br>
Will be raised when a coordinator in a cluster cannot determine the shard that is responsible for a given document.</p>
</li>
<li><p><a name="ERROR_CLUSTER_CONNECTION_LOST"></a><strong>1465</strong> - <strong>ERROR_CLUSTER_CONNECTION_LOST</strong><br>
Will be raised when a coordinator in a cluster loses an HTTP connection to a DBserver in the cluster whilst transferring data.</p>
</li>
<li><p><a name="ERROR_CLUSTER_MUST_NOT_SPECIFY_KEY"></a><strong>1466</strong> - <strong>ERROR_CLUSTER_MUST_NOT_SPECIFY_KEY</strong><br>
Will be raised when a coordinator in a cluster finds that the _key attribute was specified in a sharded collection the uses not only _key as sharding attribute.</p>
</li>
<li><p><a name="ERROR_CLUSTER_GOT_CONTRADICTING_ANSWERS"></a><strong>1467</strong> - <strong>ERROR_CLUSTER_GOT_CONTRADICTING_ANSWERS</strong><br>
Will be raised if a coordinator in a cluster gets conflicting results from different shards, which should never happen.</p>
</li>
<li><p><a name="ERROR_CLUSTER_NOT_ALL_SHARDING_ATTRIBUTES_GIVEN"></a><strong>1468</strong> - <strong>ERROR_CLUSTER_NOT_ALL_SHARDING_ATTRIBUTES_GIVEN</strong><br>
Will be raised if a coordinator tries to find out which shard is responsible for a partial document, but cannot do this because not all sharding attributes are specified.</p>
</li>
<li><p><a name="ERROR_CLUSTER_MUST_NOT_CHANGE_SHARDING_ATTRIBUTES"></a><strong>1469</strong> - <strong>ERROR_CLUSTER_MUST_NOT_CHANGE_SHARDING_ATTRIBUTES</strong><br>
Will be raised if there is an attempt to update the value of a shard attribute.</p>
</li>
<li><p><a name="ERROR_CLUSTER_UNSUPPORTED"></a><strong>1470</strong> - <strong>ERROR_CLUSTER_UNSUPPORTED</strong><br>
Will be raised when there is an attempt to carry out an operation that is not supported in the context of a sharded collection.</p>
</li>
<li><p><a name="ERROR_CLUSTER_ONLY_ON_COORDINATOR"></a><strong>1471</strong> - <strong>ERROR_CLUSTER_ONLY_ON_COORDINATOR</strong><br>
Will be raised if there is an attempt to run a coordinator-only operation on a different type of node.</p>
</li>
<li><p><a name="ERROR_CLUSTER_READING_PLAN_AGENCY"></a><strong>1472</strong> - <strong>ERROR_CLUSTER_READING_PLAN_AGENCY</strong><br>
Will be raised if a coordinator or DBserver cannot read the Plan in the agency.</p>
</li>
<li><p><a name="ERROR_CLUSTER_COULD_NOT_TRUNCATE_COLLECTION"></a><strong>1473</strong> - <strong>ERROR_CLUSTER_COULD_NOT_TRUNCATE_COLLECTION</strong><br>
Will be raised if a coordinator cannot truncate all shards of a cluster collection.</p>
</li>
<li><p><a name="ERROR_CLUSTER_AQL_COMMUNICATION"></a><strong>1474</strong> - <strong>ERROR_CLUSTER_AQL_COMMUNICATION</strong><br>
Will be raised if the internal communication of the cluster for AQL produces an error.</p>
</li>
<li><p><a name="ERROR_ARANGO_DOCUMENT_NOT_FOUND_OR_SHARDING_ATTRIBUTES_CHANGED"></a><strong>1475</strong> - <strong>ERROR_ARANGO_DOCUMENT_NOT_FOUND_OR_SHARDING_ATTRIBUTES_CHANGED</strong><br>
Will be raised when a document with a given identifier or handle is unknown, or if the sharding attributes have been changed in a REPLACE operation in the cluster.</p>
</li>
<li><p><a name="ERROR_CLUSTER_COULD_NOT_DETERMINE_ID"></a><strong>1476</strong> - <strong>ERROR_CLUSTER_COULD_NOT_DETERMINE_ID</strong><br>
Will be raised if a cluster server at startup could not determine its own ID from the local info provided.</p>
</li>
<li><p><a name="ERROR_CLUSTER_ONLY_ON_DBSERVER"></a><strong>1477</strong> - <strong>ERROR_CLUSTER_ONLY_ON_DBSERVER</strong><br>
Will be raised if there is an attempt to run a DBserver-only operation on a different type of node.</p>
</li>
<li><p><a name="ERROR_CLUSTER_BACKEND_UNAVAILABLE"></a><strong>1478</strong> - <strong>ERROR_CLUSTER_BACKEND_UNAVAILABLE</strong><br>
Will be raised if a required db server can&apos;t be reached.</p>
</li>
<li><p><a name="ERROR_CLUSTER_UNKNOWN_CALLBACK_ENDPOINT"></a><strong>1479</strong> - <strong>ERROR_CLUSTER_UNKNOWN_CALLBACK_ENDPOINT</strong><br>
An endpoint couldn&apos;t be found</p>
</li>
<li><p><a name="ERROR_CLUSTER_AGENCY_STRUCTURE_INVALID"></a><strong>1480</strong> - <strong>ERROR_CLUSTER_AGENCY_STRUCTURE_INVALID</strong><br>
The structure in the agency is invalid</p>
</li>
</ul>
<h2 id="arangodb-query-errors">ArangoDB query errors</h2>
<ul>
<li><p><a name="ERROR_QUERY_KILLED"></a><strong>1500</strong> - <strong>ERROR_QUERY_KILLED</strong><br>
Will be raised when a running query is killed by an explicit admin command.</p>
</li>
<li><p><a name="ERROR_QUERY_PARSE"></a><strong>1501</strong> - <strong>ERROR_QUERY_PARSE</strong><br>
Will be raised when query is parsed and is found to be syntactically invalid.</p>
</li>
<li><p><a name="ERROR_QUERY_EMPTY"></a><strong>1502</strong> - <strong>ERROR_QUERY_EMPTY</strong><br>
Will be raised when an empty query is specified.</p>
</li>
<li><p><a name="ERROR_QUERY_SCRIPT"></a><strong>1503</strong> - <strong>ERROR_QUERY_SCRIPT</strong><br>
Will be raised when a runtime error is caused by the query.</p>
</li>
<li><p><a name="ERROR_QUERY_NUMBER_OUT_OF_RANGE"></a><strong>1504</strong> - <strong>ERROR_QUERY_NUMBER_OUT_OF_RANGE</strong><br>
Will be raised when a number is outside the expected range.</p>
</li>
<li><p><a name="ERROR_QUERY_VARIABLE_NAME_INVALID"></a><strong>1510</strong> - <strong>ERROR_QUERY_VARIABLE_NAME_INVALID</strong><br>
Will be raised when an invalid variable name is used.</p>
</li>
<li><p><a name="ERROR_QUERY_VARIABLE_REDECLARED"></a><strong>1511</strong> - <strong>ERROR_QUERY_VARIABLE_REDECLARED</strong><br>
Will be raised when a variable gets re-assigned in a query.</p>
</li>
<li><p><a name="ERROR_QUERY_VARIABLE_NAME_UNKNOWN"></a><strong>1512</strong> - <strong>ERROR_QUERY_VARIABLE_NAME_UNKNOWN</strong><br>
Will be raised when an unknown variable is used or the variable is undefined the context it is used.</p>
</li>
<li><p><a name="ERROR_QUERY_COLLECTION_LOCK_FAILED"></a><strong>1521</strong> - <strong>ERROR_QUERY_COLLECTION_LOCK_FAILED</strong><br>
Will be raised when a read lock on the collection cannot be acquired.</p>
</li>
<li><p><a name="ERROR_QUERY_TOO_MANY_COLLECTIONS"></a><strong>1522</strong> - <strong>ERROR_QUERY_TOO_MANY_COLLECTIONS</strong><br>
Will be raised when the number of collections in a query is beyond the allowed value.</p>
</li>
<li><p><a name="ERROR_QUERY_DOCUMENT_ATTRIBUTE_REDECLARED"></a><strong>1530</strong> - <strong>ERROR_QUERY_DOCUMENT_ATTRIBUTE_REDECLARED</strong><br>
Will be raised when a document attribute is re-assigned.</p>
</li>
<li><p><a name="ERROR_QUERY_FUNCTION_NAME_UNKNOWN"></a><strong>1540</strong> - <strong>ERROR_QUERY_FUNCTION_NAME_UNKNOWN</strong><br>
Will be raised when an undefined function is called.</p>
</li>
<li><p><a name="ERROR_QUERY_FUNCTION_ARGUMENT_NUMBER_MISMATCH"></a><strong>1541</strong> - <strong>ERROR_QUERY_FUNCTION_ARGUMENT_NUMBER_MISMATCH</strong><br>
Will be raised when the number of arguments used in a function call does not match the expected number of arguments for the function.</p>
</li>
<li><p><a name="ERROR_QUERY_FUNCTION_ARGUMENT_TYPE_MISMATCH"></a><strong>1542</strong> - <strong>ERROR_QUERY_FUNCTION_ARGUMENT_TYPE_MISMATCH</strong><br>
Will be raised when the type of an argument used in a function call does not match the expected argument type.</p>
</li>
<li><p><a name="ERROR_QUERY_INVALID_REGEX"></a><strong>1543</strong> - <strong>ERROR_QUERY_INVALID_REGEX</strong><br>
Will be raised when an invalid regex argument value is used in a call to a function that expects a regex.</p>
</li>
<li><p><a name="ERROR_QUERY_BIND_PARAMETERS_INVALID"></a><strong>1550</strong> - <strong>ERROR_QUERY_BIND_PARAMETERS_INVALID</strong><br>
Will be raised when the structure of bind parameters passed has an unexpected format.</p>
</li>
<li><p><a name="ERROR_QUERY_BIND_PARAMETER_MISSING"></a><strong>1551</strong> - <strong>ERROR_QUERY_BIND_PARAMETER_MISSING</strong><br>
Will be raised when a bind parameter was declared in the query but the query is being executed with no value for that parameter.</p>
</li>
<li><p><a name="ERROR_QUERY_BIND_PARAMETER_UNDECLARED"></a><strong>1552</strong> - <strong>ERROR_QUERY_BIND_PARAMETER_UNDECLARED</strong><br>
Will be raised when a value gets specified for an undeclared bind parameter.</p>
</li>
<li><p><a name="ERROR_QUERY_BIND_PARAMETER_TYPE"></a><strong>1553</strong> - <strong>ERROR_QUERY_BIND_PARAMETER_TYPE</strong><br>
Will be raised when a bind parameter has an invalid value or type.</p>
</li>
<li><p><a name="ERROR_QUERY_INVALID_LOGICAL_VALUE"></a><strong>1560</strong> - <strong>ERROR_QUERY_INVALID_LOGICAL_VALUE</strong><br>
Will be raised when a non-boolean value is used in a logical operation.</p>
</li>
<li><p><a name="ERROR_QUERY_INVALID_ARITHMETIC_VALUE"></a><strong>1561</strong> - <strong>ERROR_QUERY_INVALID_ARITHMETIC_VALUE</strong><br>
Will be raised when a non-numeric value is used in an arithmetic operation.</p>
</li>
<li><p><a name="ERROR_QUERY_DIVISION_BY_ZERO"></a><strong>1562</strong> - <strong>ERROR_QUERY_DIVISION_BY_ZERO</strong><br>
Will be raised when there is an attempt to divide by zero.</p>
</li>
<li><p><a name="ERROR_QUERY_ARRAY_EXPECTED"></a><strong>1563</strong> - <strong>ERROR_QUERY_ARRAY_EXPECTED</strong><br>
Will be raised when a non-array operand is used for an operation that expects an array argument operand.</p>
</li>
<li><p><a name="ERROR_QUERY_FAIL_CALLED"></a><strong>1569</strong> - <strong>ERROR_QUERY_FAIL_CALLED</strong><br>
Will be raised when the function FAIL() is called from inside a query.</p>
</li>
<li><p><a name="ERROR_QUERY_GEO_INDEX_MISSING"></a><strong>1570</strong> - <strong>ERROR_QUERY_GEO_INDEX_MISSING</strong><br>
Will be raised when a geo restriction was specified but no suitable geo index is found to resolve it.</p>
</li>
<li><p><a name="ERROR_QUERY_FULLTEXT_INDEX_MISSING"></a><strong>1571</strong> - <strong>ERROR_QUERY_FULLTEXT_INDEX_MISSING</strong><br>
Will be raised when a fulltext query is performed on a collection without a suitable fulltext index.</p>
</li>
<li><p><a name="ERROR_QUERY_INVALID_DATE_VALUE"></a><strong>1572</strong> - <strong>ERROR_QUERY_INVALID_DATE_VALUE</strong><br>
Will be raised when a value cannot be converted to a date.</p>
</li>
<li><p><a name="ERROR_QUERY_MULTI_MODIFY"></a><strong>1573</strong> - <strong>ERROR_QUERY_MULTI_MODIFY</strong><br>
Will be raised when an AQL query contains more than one data-modifying operation.</p>
</li>
<li><p><a name="ERROR_QUERY_INVALID_AGGREGATE_EXPRESSION"></a><strong>1574</strong> - <strong>ERROR_QUERY_INVALID_AGGREGATE_EXPRESSION</strong><br>
Will be raised when an AQL query contains an invalid aggregate expression.</p>
</li>
<li><p><a name="ERROR_QUERY_COMPILE_TIME_OPTIONS"></a><strong>1575</strong> - <strong>ERROR_QUERY_COMPILE_TIME_OPTIONS</strong><br>
Will be raised when an AQL data-modification query contains options that cannot be figured out at query compile time.</p>
</li>
<li><p><a name="ERROR_QUERY_EXCEPTION_OPTIONS"></a><strong>1576</strong> - <strong>ERROR_QUERY_EXCEPTION_OPTIONS</strong><br>
Will be raised when an AQL data-modification query contains an invalid options specification.</p>
</li>
<li><p><a name="ERROR_QUERY_COLLECTION_USED_IN_EXPRESSION"></a><strong>1577</strong> - <strong>ERROR_QUERY_COLLECTION_USED_IN_EXPRESSION</strong><br>
Will be raised when a collection is used as an operand in an AQL expression.</p>
</li>
<li><p><a name="ERROR_QUERY_DISALLOWED_DYNAMIC_CALL"></a><strong>1578</strong> - <strong>ERROR_QUERY_DISALLOWED_DYNAMIC_CALL</strong><br>
Will be raised when a dynamic function call is made to a function that cannot be called dynamically.</p>
</li>
<li><p><a name="ERROR_QUERY_ACCESS_AFTER_MODIFICATION"></a><strong>1579</strong> - <strong>ERROR_QUERY_ACCESS_AFTER_MODIFICATION</strong><br>
Will be raised when collection data are accessed after a data-modification operation.</p>
</li>
</ul>
<h2 id="aql-user-function-errors">AQL user function errors</h2>
<ul>
<li><p><a name="ERROR_QUERY_FUNCTION_INVALID_NAME"></a><strong>1580</strong> - <strong>ERROR_QUERY_FUNCTION_INVALID_NAME</strong><br>
Will be raised when a user function with an invalid name is registered.</p>
</li>
<li><p><a name="ERROR_QUERY_FUNCTION_INVALID_CODE"></a><strong>1581</strong> - <strong>ERROR_QUERY_FUNCTION_INVALID_CODE</strong><br>
Will be raised when a user function is registered with invalid code.</p>
</li>
<li><p><a name="ERROR_QUERY_FUNCTION_NOT_FOUND"></a><strong>1582</strong> - <strong>ERROR_QUERY_FUNCTION_NOT_FOUND</strong><br>
Will be raised when a user function is accessed but not found.</p>
</li>
<li><p><a name="ERROR_QUERY_FUNCTION_RUNTIME_ERROR"></a><strong>1583</strong> - <strong>ERROR_QUERY_FUNCTION_RUNTIME_ERROR</strong><br>
Will be raised when a user function throws a runtime exception.</p>
</li>
</ul>
<h2 id="aql-query-registry-errors">AQL query registry errors</h2>
<ul>
<li><p><a name="ERROR_QUERY_BAD_JSON_PLAN"></a><strong>1590</strong> - <strong>ERROR_QUERY_BAD_JSON_PLAN</strong><br>
Will be raised when an HTTP API for a query got an invalid JSON object.</p>
</li>
<li><p><a name="ERROR_QUERY_NOT_FOUND"></a><strong>1591</strong> - <strong>ERROR_QUERY_NOT_FOUND</strong><br>
Will be raised when an Id of a query is not found by the HTTP API.</p>
</li>
<li><p><a name="ERROR_QUERY_IN_USE"></a><strong>1592</strong> - <strong>ERROR_QUERY_IN_USE</strong><br>
Will be raised when an Id of a query is found by the HTTP API but the query is in use.</p>
</li>
</ul>
<h2 id="arangodb-cursor-errors">ArangoDB cursor errors</h2>
<ul>
<li><p><a name="ERROR_CURSOR_NOT_FOUND"></a><strong>1600</strong> - <strong>ERROR_CURSOR_NOT_FOUND</strong><br>
Will be raised when a cursor is requested via its id but a cursor with that id cannot be found.</p>
</li>
<li><p><a name="ERROR_CURSOR_BUSY"></a><strong>1601</strong> - <strong>ERROR_CURSOR_BUSY</strong><br>
Will be raised when a cursor is requested via its id but a concurrent request is still using the cursor.</p>
</li>
</ul>
<h2 id="arangodb-transaction-errors">ArangoDB transaction errors</h2>
<ul>
<li><p><a name="ERROR_TRANSACTION_INTERNAL"></a><strong>1650</strong> - <strong>ERROR_TRANSACTION_INTERNAL</strong><br>
Will be raised when a wrong usage of transactions is detected. this is an internal error and indicates a bug in ArangoDB.</p>
</li>
<li><p><a name="ERROR_TRANSACTION_NESTED"></a><strong>1651</strong> - <strong>ERROR_TRANSACTION_NESTED</strong><br>
Will be raised when transactions are nested.</p>
</li>
<li><p><a name="ERROR_TRANSACTION_UNREGISTERED_COLLECTION"></a><strong>1652</strong> - <strong>ERROR_TRANSACTION_UNREGISTERED_COLLECTION</strong><br>
Will be raised when a collection is used in the middle of a transaction but was not registered at transaction start.</p>
</li>
<li><p><a name="ERROR_TRANSACTION_DISALLOWED_OPERATION"></a><strong>1653</strong> - <strong>ERROR_TRANSACTION_DISALLOWED_OPERATION</strong><br>
Will be raised when a disallowed operation is carried out in a transaction.</p>
</li>
<li><p><a name="ERROR_TRANSACTION_ABORTED"></a><strong>1654</strong> - <strong>ERROR_TRANSACTION_ABORTED</strong><br>
Will be raised when a transaction was aborted.</p>
</li>
</ul>
<h2 id="user-management-errors">User management errors</h2>
<ul>
<li><p><a name="ERROR_USER_INVALID_NAME"></a><strong>1700</strong> - <strong>ERROR_USER_INVALID_NAME</strong><br>
Will be raised when an invalid user name is used.</p>
</li>
<li><p><a name="ERROR_USER_INVALID_PASSWORD"></a><strong>1701</strong> - <strong>ERROR_USER_INVALID_PASSWORD</strong><br>
Will be raised when an invalid password is used.</p>
</li>
<li><p><a name="ERROR_USER_DUPLICATE"></a><strong>1702</strong> - <strong>ERROR_USER_DUPLICATE</strong><br>
Will be raised when a user name already exists.</p>
</li>
<li><p><a name="ERROR_USER_NOT_FOUND"></a><strong>1703</strong> - <strong>ERROR_USER_NOT_FOUND</strong><br>
Will be raised when a user name is updated that does not exist.</p>
</li>
<li><p><a name="ERROR_USER_CHANGE_PASSWORD"></a><strong>1704</strong> - <strong>ERROR_USER_CHANGE_PASSWORD</strong><br>
Will be raised when the user must change his password.</p>
</li>
</ul>
<h2 id="service-management-errors">Service management errors</h2>
<ul>
<li><p><a name="ERROR_SERVICE_INVALID_NAME"></a><strong>1750</strong> - <strong>ERROR_SERVICE_INVALID_NAME</strong><br>
Will be raised when an invalid service name is specified.</p>
</li>
<li><p><a name="ERROR_SERVICE_INVALID_MOUNT"></a><strong>1751</strong> - <strong>ERROR_SERVICE_INVALID_MOUNT</strong><br>
Will be raised when an invalid mount is specified.</p>
</li>
<li><p><a name="ERROR_SERVICE_DOWNLOAD_FAILED"></a><strong>1752</strong> - <strong>ERROR_SERVICE_DOWNLOAD_FAILED</strong><br>
Will be raised when a service download from the central repository failed.</p>
</li>
<li><p><a name="ERROR_SERVICE_UPLOAD_FAILED"></a><strong>1753</strong> - <strong>ERROR_SERVICE_UPLOAD_FAILED</strong><br>
Will be raised when a service upload from the client to the ArangoDB server failed.</p>
</li>
</ul>
<h2 id="key-value-access-errors">Key value access errors</h2>
<ul>
<li><p><a name="ERROR_KEYVALUE_INVALID_KEY"></a><strong>1800</strong> - <strong>ERROR_KEYVALUE_INVALID_KEY</strong><br>
Will be raised when an invalid key specification is passed to the server</p>
</li>
<li><p><a name="ERROR_KEYVALUE_KEY_EXISTS"></a><strong>1801</strong> - <strong>ERROR_KEYVALUE_KEY_EXISTS</strong><br>
Will be raised when a key is to be created that already exists</p>
</li>
<li><p><a name="ERROR_KEYVALUE_KEY_NOT_FOUND"></a><strong>1802</strong> - <strong>ERROR_KEYVALUE_KEY_NOT_FOUND</strong><br>
Will be raised when the specified key is not found</p>
</li>
<li><p><a name="ERROR_KEYVALUE_KEY_NOT_UNIQUE"></a><strong>1803</strong> - <strong>ERROR_KEYVALUE_KEY_NOT_UNIQUE</strong><br>
Will be raised when the specified key is not unique</p>
</li>
<li><p><a name="ERROR_KEYVALUE_KEY_NOT_CHANGED"></a><strong>1804</strong> - <strong>ERROR_KEYVALUE_KEY_NOT_CHANGED</strong><br>
Will be raised when updating the value for a key does not work</p>
</li>
<li><p><a name="ERROR_KEYVALUE_KEY_NOT_REMOVED"></a><strong>1805</strong> - <strong>ERROR_KEYVALUE_KEY_NOT_REMOVED</strong><br>
Will be raised when deleting a key/value pair does not work</p>
</li>
<li><p><a name="ERROR_KEYVALUE_NO_VALUE"></a><strong>1806</strong> - <strong>ERROR_KEYVALUE_NO_VALUE</strong><br>
Will be raised when the value is missing</p>
</li>
</ul>
<h2 id="task-errors">Task errors</h2>
<ul>
<li><p><a name="ERROR_TASK_INVALID_ID"></a><strong>1850</strong> - <strong>ERROR_TASK_INVALID_ID</strong><br>
Will be raised when a task is created with an invalid id.</p>
</li>
<li><p><a name="ERROR_TASK_DUPLICATE_ID"></a><strong>1851</strong> - <strong>ERROR_TASK_DUPLICATE_ID</strong><br>
Will be raised when a task id is created with a duplicate id.</p>
</li>
<li><p><a name="ERROR_TASK_NOT_FOUND"></a><strong>1852</strong> - <strong>ERROR_TASK_NOT_FOUND</strong><br>
Will be raised when a task with the specified id could not be found.</p>
</li>
</ul>
<h2 id="graph--traversal-errors">Graph / traversal errors</h2>
<ul>
<li><p><a name="ERROR_GRAPH_INVALID_GRAPH"></a><strong>1901</strong> - <strong>ERROR_GRAPH_INVALID_GRAPH</strong><br>
Will be raised when an invalid name is passed to the server.</p>
</li>
<li><p><a name="ERROR_GRAPH_COULD_NOT_CREATE_GRAPH"></a><strong>1902</strong> - <strong>ERROR_GRAPH_COULD_NOT_CREATE_GRAPH</strong><br>
Will be raised when an invalid name, vertices or edges is passed to the server.</p>
</li>
<li><p><a name="ERROR_GRAPH_INVALID_VERTEX"></a><strong>1903</strong> - <strong>ERROR_GRAPH_INVALID_VERTEX</strong><br>
Will be raised when an invalid vertex id is passed to the server.</p>
</li>
<li><p><a name="ERROR_GRAPH_COULD_NOT_CREATE_VERTEX"></a><strong>1904</strong> - <strong>ERROR_GRAPH_COULD_NOT_CREATE_VERTEX</strong><br>
Will be raised when the vertex could not be created.</p>
</li>
<li><p><a name="ERROR_GRAPH_COULD_NOT_CHANGE_VERTEX"></a><strong>1905</strong> - <strong>ERROR_GRAPH_COULD_NOT_CHANGE_VERTEX</strong><br>
Will be raised when the vertex could not be changed.</p>
</li>
<li><p><a name="ERROR_GRAPH_INVALID_EDGE"></a><strong>1906</strong> - <strong>ERROR_GRAPH_INVALID_EDGE</strong><br>
Will be raised when an invalid edge id is passed to the server.</p>
</li>
<li><p><a name="ERROR_GRAPH_COULD_NOT_CREATE_EDGE"></a><strong>1907</strong> - <strong>ERROR_GRAPH_COULD_NOT_CREATE_EDGE</strong><br>
Will be raised when the edge could not be created.</p>
</li>
<li><p><a name="ERROR_GRAPH_COULD_NOT_CHANGE_EDGE"></a><strong>1908</strong> - <strong>ERROR_GRAPH_COULD_NOT_CHANGE_EDGE</strong><br>
Will be raised when the edge could not be changed.</p>
</li>
<li><p><a name="ERROR_GRAPH_TOO_MANY_ITERATIONS"></a><strong>1909</strong> - <strong>ERROR_GRAPH_TOO_MANY_ITERATIONS</strong><br>
Will be raised when too many iterations are done in a graph traversal.</p>
</li>
<li><p><a name="ERROR_GRAPH_INVALID_FILTER_RESULT"></a><strong>1910</strong> - <strong>ERROR_GRAPH_INVALID_FILTER_RESULT</strong><br>
Will be raised when an invalid filter result is returned in a graph traversal.</p>
</li>
<li><p><a name="ERROR_GRAPH_COLLECTION_MULTI_USE"></a><strong>1920</strong> - <strong>ERROR_GRAPH_COLLECTION_MULTI_USE</strong><br>
an edge collection may only be used once in one edge definition of a graph.,</p>
</li>
<li><p><a name="ERROR_GRAPH_COLLECTION_USE_IN_MULTI_GRAPHS"></a><strong>1921</strong> - <strong>ERROR_GRAPH_COLLECTION_USE_IN_MULTI_GRAPHS</strong><br>
 is already used by another graph in a different edge definition.,</p>
</li>
<li><p><a name="ERROR_GRAPH_CREATE_MISSING_NAME"></a><strong>1922</strong> - <strong>ERROR_GRAPH_CREATE_MISSING_NAME</strong><br>
a graph name is required to create a graph.,</p>
</li>
<li><p><a name="ERROR_GRAPH_CREATE_MALFORMED_EDGE_DEFINITION"></a><strong>1923</strong> - <strong>ERROR_GRAPH_CREATE_MALFORMED_EDGE_DEFINITION</strong><br>
the edge definition is malformed. It has to be an array of objects.,</p>
</li>
<li><p><a name="ERROR_GRAPH_NOT_FOUND"></a><strong>1924</strong> - <strong>ERROR_GRAPH_NOT_FOUND</strong><br>
a graph with this name could not be found.,</p>
</li>
<li><p><a name="ERROR_GRAPH_DUPLICATE"></a><strong>1925</strong> - <strong>ERROR_GRAPH_DUPLICATE</strong><br>
a graph with this name already exists.,</p>
</li>
<li><p><a name="ERROR_GRAPH_VERTEX_COL_DOES_NOT_EXIST"></a><strong>1926</strong> - <strong>ERROR_GRAPH_VERTEX_COL_DOES_NOT_EXIST</strong><br>
the specified vertex collection does not exist or is not part of the graph.,</p>
</li>
<li><p><a name="ERROR_GRAPH_WRONG_COLLECTION_TYPE_VERTEX"></a><strong>1927</strong> - <strong>ERROR_GRAPH_WRONG_COLLECTION_TYPE_VERTEX</strong><br>
the collection is not a vertex collection.,</p>
</li>
<li><p><a name="ERROR_GRAPH_NOT_IN_ORPHAN_COLLECTION"></a><strong>1928</strong> - <strong>ERROR_GRAPH_NOT_IN_ORPHAN_COLLECTION</strong><br>
Vertex collection not in orphan collection of the graph.,</p>
</li>
<li><p><a name="ERROR_GRAPH_COLLECTION_USED_IN_EDGE_DEF"></a><strong>1929</strong> - <strong>ERROR_GRAPH_COLLECTION_USED_IN_EDGE_DEF</strong><br>
The collection is already used in an edge definition of the graph.,</p>
</li>
<li><p><a name="ERROR_GRAPH_EDGE_COLLECTION_NOT_USED"></a><strong>1930</strong> - <strong>ERROR_GRAPH_EDGE_COLLECTION_NOT_USED</strong><br>
The edge collection is not used in any edge definition of the graph.,</p>
</li>
<li><p><a name="ERROR_GRAPH_NOT_AN_ARANGO_COLLECTION"></a><strong>1931</strong> - <strong>ERROR_GRAPH_NOT_AN_ARANGO_COLLECTION</strong><br>
The collection is not an ArangoCollection.,</p>
</li>
<li><p><a name="ERROR_GRAPH_NO_GRAPH_COLLECTION"></a><strong>1932</strong> - <strong>ERROR_GRAPH_NO_GRAPH_COLLECTION</strong><br>
collection _graphs does not exist.,</p>
</li>
<li><p><a name="ERROR_GRAPH_INVALID_EXAMPLE_ARRAY_OBJECT_STRING"></a><strong>1933</strong> - <strong>ERROR_GRAPH_INVALID_EXAMPLE_ARRAY_OBJECT_STRING</strong><br>
Invalid example type. Has to be String, Array or Object.,</p>
</li>
<li><p><a name="ERROR_GRAPH_INVALID_EXAMPLE_ARRAY_OBJECT"></a><strong>1934</strong> - <strong>ERROR_GRAPH_INVALID_EXAMPLE_ARRAY_OBJECT</strong><br>
Invalid example type. Has to be Array or Object.,</p>
</li>
<li><p><a name="ERROR_GRAPH_INVALID_NUMBER_OF_ARGUMENTS"></a><strong>1935</strong> - <strong>ERROR_GRAPH_INVALID_NUMBER_OF_ARGUMENTS</strong><br>
Invalid number of arguments. Expected: ,</p>
</li>
<li><p><a name="ERROR_GRAPH_INVALID_PARAMETER"></a><strong>1936</strong> - <strong>ERROR_GRAPH_INVALID_PARAMETER</strong><br>
Invalid parameter type.,</p>
</li>
<li><p><a name="ERROR_GRAPH_INVALID_ID"></a><strong>1937</strong> - <strong>ERROR_GRAPH_INVALID_ID</strong><br>
Invalid id,</p>
</li>
<li><p><a name="ERROR_GRAPH_COLLECTION_USED_IN_ORPHANS"></a><strong>1938</strong> - <strong>ERROR_GRAPH_COLLECTION_USED_IN_ORPHANS</strong><br>
The collection is already used in the orphans of the graph.,</p>
</li>
<li><p><a name="ERROR_GRAPH_EDGE_COL_DOES_NOT_EXIST"></a><strong>1939</strong> - <strong>ERROR_GRAPH_EDGE_COL_DOES_NOT_EXIST</strong><br>
the specified edge collection does not exist or is not part of the graph.,</p>
</li>
<li><p><a name="ERROR_GRAPH_EMPTY"></a><strong>1940</strong> - <strong>ERROR_GRAPH_EMPTY</strong><br>
The requested graph has no edge collections.</p>
</li>
</ul>
<h2 id="session-errors">Session errors</h2>
<ul>
<li><p><a name="ERROR_SESSION_UNKNOWN"></a><strong>1950</strong> - <strong>ERROR_SESSION_UNKNOWN</strong><br>
Will be raised when an invalid/unknown session id is passed to the server.</p>
</li>
<li><p><a name="ERROR_SESSION_EXPIRED"></a><strong>1951</strong> - <strong>ERROR_SESSION_EXPIRED</strong><br>
Will be raised when a session is expired.</p>
</li>
</ul>
<h2 id="simple-client-errors">Simple Client errors</h2>
<ul>
<li><p><a name="SIMPLE_CLIENT_UNKNOWN_ERROR"></a><strong>2000</strong> - <strong>SIMPLE_CLIENT_UNKNOWN_ERROR</strong><br>
This error should not happen.</p>
</li>
<li><p><a name="SIMPLE_CLIENT_COULD_NOT_CONNECT"></a><strong>2001</strong> - <strong>SIMPLE_CLIENT_COULD_NOT_CONNECT</strong><br>
Will be raised when the client could not connect to the server.</p>
</li>
<li><p><a name="SIMPLE_CLIENT_COULD_NOT_WRITE"></a><strong>2002</strong> - <strong>SIMPLE_CLIENT_COULD_NOT_WRITE</strong><br>
Will be raised when the client could not write data.</p>
</li>
<li><p><a name="SIMPLE_CLIENT_COULD_NOT_READ"></a><strong>2003</strong> - <strong>SIMPLE_CLIENT_COULD_NOT_READ</strong><br>
Will be raised when the client could not read data.</p>
</li>
</ul>
<h2 id="foxx-manager-errors">Foxx Manager errors</h2>
<ul>
<li><p><a name="ERROR_MALFORMED_MANIFEST_FILE"></a><strong>3000</strong> - <strong>ERROR_MALFORMED_MANIFEST_FILE</strong><br>
The manifest file is malformed. It is not in a valid JSON format.</p>
</li>
<li><p><a name="ERROR_INVALID_SERVICE_MANIFEST"></a><strong>3001</strong> - <strong>ERROR_INVALID_SERVICE_MANIFEST</strong><br>
The manifest file of this service is invalid.</p>
</li>
<li><p><a name="ERROR_INVALID_FOXX_OPTIONS"></a><strong>3004</strong> - <strong>ERROR_INVALID_FOXX_OPTIONS</strong><br>
The options used to configure the foxx are invalid.</p>
</li>
<li><p><a name="ERROR_INVALID_MOUNTPOINT"></a><strong>3007</strong> - <strong>ERROR_INVALID_MOUNTPOINT</strong><br>
mountpoint is invalid</p>
</li>
<li><p><a name="ERROR_SERVICE_NOT_FOUND"></a><strong>3009</strong> - <strong>ERROR_SERVICE_NOT_FOUND</strong><br>
No service found at this mountpoint</p>
</li>
<li><p><a name="ERROR_SERVICE_NEEDS_CONFIGURATION"></a><strong>3010</strong> - <strong>ERROR_SERVICE_NEEDS_CONFIGURATION</strong><br>
The service has to be configured before it can be used</p>
</li>
<li><p><a name="ERROR_SERVICE_MOUNTPOINT_CONFLICT"></a><strong>3011</strong> - <strong>ERROR_SERVICE_MOUNTPOINT_CONFLICT</strong><br>
A service has already been installed at this mountpoint</p>
</li>
</ul>
<h2 id="javascript-module-loader-errors">JavaScript module loader errors</h2>
<ul>
<li><p><a name="ERROR_MODULE_NOT_FOUND"></a><strong>3100</strong> - <strong>ERROR_MODULE_NOT_FOUND</strong><br>
The module path could not be resolved.</p>
</li>
<li><p><a name="ERROR_MODULE_FAILURE"></a><strong>3103</strong> - <strong>ERROR_MODULE_FAILURE</strong><br>
Failed to invoke the module in its context.</p>
</li>
</ul>
<h2 id="results">Results</h2>
<p>These are technically not errors.</p>
<ul>
<li><p><a name="RESULT_ELEMENT_EXISTS"></a><strong>10000</strong> - <strong>RESULT_ELEMENT_EXISTS</strong><br>
Will be returned if the element was not insert because it already exists.</p>
</li>
<li><p><a name="RESULT_ELEMENT_NOT_FOUND"></a><strong>10001</strong> - <strong>RESULT_ELEMENT_NOT_FOUND</strong><br>
Will be returned if the element was not found in the structure.</p>
</li>
</ul>
<h2 id="dispatcher-errors">Dispatcher errors</h2>
<ul>
<li><p><a name="ERROR_QUEUE_ALREADY_EXISTS"></a><strong>21000</strong> - <strong>ERROR_QUEUE_ALREADY_EXISTS</strong><br>
Will be returned if a queue with this name already exists.</p>
</li>
<li><p><a name="ERROR_DISPATCHER_IS_STOPPING"></a><strong>21001</strong> - <strong>ERROR_DISPATCHER_IS_STOPPING</strong><br>
Will be returned if a shutdown is in progress.</p>
</li>
<li><p><a name="ERROR_QUEUE_UNKNOWN"></a><strong>21002</strong> - <strong>ERROR_QUEUE_UNKNOWN</strong><br>
Will be returned if a queue with this name does not exist.</p>
</li>
<li><p><a name="ERROR_QUEUE_FULL"></a><strong>21003</strong> - <strong>ERROR_QUEUE_FULL</strong><br>
Will be returned if a queue with this name is full.</p>
</li>
</ul>
eos

document = Nokogiri::HTML.fragment(frag)

hash = {}


# package arangolite
#
# import "errors"
#
# // -
# var (
#   ErrArangoUniqueConstaintViolated = errors.New("ERROR_ARANGO_UNIQUE_CONSTRAINT_VIOLATED")
#
#   arangoErrors = map[int]error{
#     1210: ErrArangoUniqueConstaintViolated,
#   }
# )

document.search('li').each do |list|
  error_name = list.search('a').first['name']
  error_code = list.search('strong').first.text

  errorName = error_name.gsub('ERROR_', 'ERR_').split('_').map(&:downcase).map(&:capitalize).join('')
  errorName = 'Err' + errorName if !errorName.start_with?('Err')

  hash[error_code] = {
    errorsName: errorName,
    errorsNew: error_name
  }
end

error_variables = {}
hash.each do |_, v|
  error_variables[v[:errorsName]] = %{errors.New("#{v[:errorsNew]}")}
end

puts 'package arangolite'

puts 'import "errors"'

puts '//-'
puts 'var ('
error_variables.each do |k, v|
  puts "#{k} = #{v}"
end

puts 'arangoErrors = map[int]error{'
# 1210: ErrArangoUniqueConstaintViolated,
hash.each do |k, v|
  puts "#{k}: #{v[:errorsName]},"
end
puts '}'
puts ')'
