# Storage fundamentals

## Types of storage

### Block storage

Or block-level storage:

- ata stored in evenly sized blocks, each with its own ID
- used to store files on cloud environments
- fast, efficient, reliable storage type
  - files divided in evenly sized blocks each with its ID -> stored in a FileSystem as raw data volume
- delivered with HDD or SSD in Google Cloud
- **can be mounted** or **used as boot device**

Use cases: high-performance storage

### File storage

Or file-level/based storage:

- presented as a network file system(NFS) -> directory tree structure
  - functions similarly to a local hard drive
- once a structure is applied, it cannot be changed
- **can be mounted, but not used as a boot device**
- offered as Cloud File Storage in Google Cloud
  - use of NFS v3 protocol

Use cases: share storage between multiple VMs

### Object storage

Or object-level/based storage:

- flat collection of unstructured data
- characteristics:
  - data (can be binary data)
  - metadata
  - globally unique IDs -> find data without knowing its location
- offered as Cloud Storage
  - logical container called *bucket*
  - is infinitely scalable
- by default it cannot be mounted
  - **can be mounted** using a tool called Fuse
- **not bootable**

Use cases: store large amounts of unstructured data, such as images, videos, backups, and logs

## Storage performance

Factors determining performance:

- I/O -> single read/write request, measures in block size(from 1kB to 4MB)
- I/O Queue depth -> # of pending I/O requests waiting to be performed on a disk
- IOPS -> IO Operations per Second: how many IO operations a device or a group of devices can perform in 1 second
- Throughput(MB/s) -> speed at which the data is transferred in 1s 
- Latency(ms) -> delay between the time data is requested and data is served
- Sequential access (e.g. reading a video file)
- Random access (e.g. reading an application) -> slower than sequential access

