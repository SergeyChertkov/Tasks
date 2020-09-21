package amazon;

public class AWSSnapshot extends AWSObj {

    public AWSSnapshot(String snapshotData) {
        try {
            this.id = Long.parseLong(snapshotData.toLowerCase().split("id:")[1].split(",")[0]);
        } catch (ArrayIndexOutOfBoundsException e) {
            throw new AWSException("ID is not found for instance: " + snapshotData);
        }
        if (snapshotData.toLowerCase().split("name:").length > 1) {
            this.name = snapshotData.toLowerCase().split("name:")[1].split(",")[0];
        }
        try {
            this.region = snapshotData.toLowerCase().split("region:")[1].split(",")[0];
        } catch (ArrayIndexOutOfBoundsException e) {
            throw new AWSException("Region is not found for instance: " + snapshotData);
        }
        if (snapshotData.toLowerCase().split("attached_instance_id:").length > 1) {
            this.sourceVolumeId = Long.parseLong(snapshotData.toLowerCase().split("source_volume_id:")[1].split(",")[0]);
        } else {
            this.sourceVolumeId = -1;
        }
    }

    @Override
    public String toString() {
        return "AWSSnapshot(id=" + id +
                ", name=" + name +
                ", region=" + region +
                ", sourceVolumeId=" + sourceVolumeId +
                ")";
    }

}
