package amazon;

public class AWSVolume extends AWSObj {

    public AWSVolume(String volumeData) {
        try {
            this.id = Long.parseLong(volumeData.toLowerCase().split("id:")[1].split(",")[0]);
        } catch (ArrayIndexOutOfBoundsException e) {
            throw new AWSException("ID is not found for instance: " + volumeData);
        }
        if (volumeData.toLowerCase().split("name:").length > 1) {
            this.name = volumeData.toLowerCase().split("name:")[1].split(",")[0];
        }
        try {
            this.state = volumeData.toLowerCase().split("state:")[1].split(",")[0];
        } catch (ArrayIndexOutOfBoundsException e) {
            throw new AWSException("State is not found for instance: " + volumeData);
        }
        try {
            this.region = volumeData.toLowerCase().split("region:")[1].split(",")[0];
        } catch (ArrayIndexOutOfBoundsException e) {
            throw new AWSException("Region is not found for instance: " + volumeData);
        }
        if (volumeData.toLowerCase().split("attached_instance_id:").length > 1) {
            this.attachedInstanceId = Long.parseLong(volumeData.toLowerCase().split("attached_instance_id:")[1].split(",")[0]);
        } else {
            this.attachedInstanceId = -1;
        }
    }

    @Override
    public String toString() {
        return "AWSInstance(id=" + id +
                ", name=" + name +
                ", state=" + state +
                ", region=" + region +
                ", attachedInstanceId=" + attachedInstanceId +
                ")";
    }

}
