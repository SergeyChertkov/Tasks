package amazon;

public class AWSInstance extends AWSObj {

    public AWSInstance(String instanceData) {
        try {
            this.id = Long.parseLong(instanceData.toLowerCase().split("id:")[1].split(",")[0]);
        } catch (ArrayIndexOutOfBoundsException e) {
            throw new AWSException("ID is not found for instance: " + instanceData);
        }
        if (instanceData.toLowerCase().split("name:").length > 1) {
            this.name = instanceData.toLowerCase().split("name:")[1].split(",")[0];
        }
        try {
            this.type = instanceData.toLowerCase().split("type:")[1].split(",")[0];
        } catch (ArrayIndexOutOfBoundsException e) {
            throw new AWSException("Type is not found for instance: " + instanceData);
        }
        try {
            this.state = instanceData.toLowerCase().split("state:")[1].split(",")[0];
        } catch (ArrayIndexOutOfBoundsException e) {
            throw new AWSException("State is not found for instance: " + instanceData);
        }
        try {
            this.region = instanceData.toLowerCase().split("region:")[1].split(",")[0];
        } catch (ArrayIndexOutOfBoundsException e) {
            throw new AWSException("Region is not found for instance: " + instanceData);
        }
    }

    @Override
    public String toString() {
        return "AWSInstance(id=" + id +
                ", name=" + name +
                ", type=" + type +
                ", state=" + state +
                ", region=" + region +
                ")";
    }
}
